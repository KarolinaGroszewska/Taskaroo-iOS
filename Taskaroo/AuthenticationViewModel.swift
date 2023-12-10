//
//  AuthenticationViewModel.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/4/23.
//

import Firebase
import GoogleSignIn
import SwiftUI
import AuthenticationServices
import CryptoKit

var uid = ""
class AuthenticationViewModel: ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    fileprivate var currentNonce: String?
    let db = Firestore.firestore()
    
    @Published var state: SignInState = .signedOut
    
    func signIn() {
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
            authenticateUser(for: user, with: error)
        }
      } else {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let configuration = GIDConfiguration(clientID: clientID)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
          authenticateUser(for: user, with: error)
        }
      }
    }
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
            let user = Auth.auth().currentUser
            uid = user!.uid
            let email = user?.email
            self.db.collection("users").document(uid).setData(["email": email ?? ""], merge: true)
            self.state = .signedIn
        }
      }
    }
    func signOut() {
      GIDSignIn.sharedInstance.signOut()
      do {
        try Auth.auth().signOut()
        state = .signedOut
      } catch {
        print(error.localizedDescription)
      }
    }
    
    func SignInButton(_ type: SignInWithAppleButton.Style) -> some View{
        return SignInWithAppleButton(.signIn) { request in
            let nonce = self.randomNonceString()
            self.currentNonce = nonce
            request.requestedScopes = [.fullName, .email]
            request.nonce = self.sha256(nonce)
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                NotificationManager.instance.requestAuthorization()
                   if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
                       guard let nonce = self.currentNonce else {
                         fatalError("Invalid state: A login callback was received, but no login request was sent.")
                       }
                       guard let appleIDToken = appleIDCredential.identityToken else {
                         print("Unable to fetch identity token")
                         return
                       }
                       guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                         print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                         return
                       }
                       let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString,rawNonce: nonce)
                       Auth.auth().signIn(with: credential) { (result, error) in
                           NotificationManager.instance.requestAuthorization()
                           let user = Auth.auth().currentUser
                           uid = user!.uid
                           let email = user?.email
                           self.db.collection("users").document(uid).setData(["email": email ?? ""], merge: true)
                           self.state = .signedIn
                       }
                   }
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .frame(width: 280, height: 60, alignment: .center)
        .signInWithAppleButtonStyle(type)
    }
    func randomNonceString(length: Int = 32) -> String {
          precondition(length > 0)
          var randomBytes = [UInt8](repeating: 0, count: length)
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }

          let charset: [Character] =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

          let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
          }

          return String(nonce)
        }
        
        @available(iOS 13, *)
        func sha256(_ input: String) -> String {
          let inputData = Data(input.utf8)
          let hashedData = SHA256.hash(data: inputData)
          let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
          }.joined()

          return hashString
        }
    func addNewUser(user: User){
        let db = Firestore.firestore()
        let newDocumentReference = db.collection("users").document(user.id.description)
        try? newDocumentReference.setData(from: user){error in
            if error != nil{
                
            }
        }
    }
}

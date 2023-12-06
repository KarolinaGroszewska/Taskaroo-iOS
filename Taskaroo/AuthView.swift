//
//  ContentView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/4/23.
//

import SwiftUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI


struct AuthView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
      VStack {
        Spacer()
        Image("taskaroo")
          .resizable()
          .aspectRatio(contentMode: .fit)

        Text("Welcome to Taskaroo!")
          .fontWeight(.black)
          .foregroundColor(Color(red: 21/255, green: 99/255, blue: 255/255))
          .font(.largeTitle)
          .multilineTextAlignment(.center)

        Text("Empowering Productivity, One Task at a Time!")
          .fontWeight(.light)
          .multilineTextAlignment(.center)
          .padding()

        SignInWithAppleSwiftUIButton()
          
        GoogleSignInButton()
              .frame(width: 286, height: 60, alignment: .center)
              .onTapGesture {
                  viewModel.signIn()
              }
          Spacer()
      }
    }
}

#Preview {
    AuthView()
}

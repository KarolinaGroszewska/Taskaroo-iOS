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
        ZStack{
            Color(red: 214/255, green: 215/255, blue: 217/255).ignoresSafeArea()
            VStack {
                Spacer()
                Image("taskaroo")
                    .resizable()
                    .frame(width: 200, height: 160, alignment: .center)
                
                Text("Taskaroo")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding([.bottom], 2)
                
                Text("Empowering Productivity, One Task at a Time")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding([.bottom], 20)
                
                SignInWithAppleSwiftUIButton()
                    .padding([.bottom], 2)
                Button(action: {
                    viewModel.signIn()
                }){
                    Image("google-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Sign in with Google")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                }
                .padding()
                .frame(width: 280, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                    .cornerRadius(5))
                Spacer()
            }
        }
    }
    
}

#Preview {
    AuthView()
}

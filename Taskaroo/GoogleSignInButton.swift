//
//  GoogleSignInButton.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/5/23.
//

import SwiftUI

struct SignInWithGoogleSwiftUIButton: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
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
    }
}

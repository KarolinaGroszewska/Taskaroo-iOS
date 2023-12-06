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
    var body: some View {
        NavigationView{
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
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    
                    NavigationLink{
                        HomeView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    } label: {
                        SignInWithAppleSwiftUIButton()
                    }
                    NavigationLink{
                        HomeView()
                    } label: {
                        SignInWithGoogleSwiftUIButton()
                    }
                    Spacer()
                }
            }
        }
    }
    
}

#Preview {
    AuthView()
}

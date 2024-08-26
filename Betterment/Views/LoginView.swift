//
//  LoginView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-08-26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
         
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(Color.pink)
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(125))
                .offset(y: -350)
            
            VStack(){
                Text("Welcome.")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundStyle(Color.white)
                    .frame(width: 350)
                    .bold()
                    .padding(.bottom, 5)
                
                SecureField("Password", text: $password)
                    .foregroundStyle(Color.white)
                    .frame(width: 350)
                    .bold()
           
                Button(action: {}, label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(Color.white).opacity(0.9)
                        .foregroundStyle(Color.black)
                        .padding(.top, 200)
                })
                
                Button(action: {}, label: {
                    Text("Already have an account?")
                        .bold()
                        .foregroundStyle(Color.white)
                        .offset(y: 10)
                })
            }
        }
    }
}


#Preview {
    LoginView()
}

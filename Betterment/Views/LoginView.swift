//
//  LoginView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-08-26.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
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
                Spacer()
                Text("Welcome.")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .offset(x: -100, y: -10)
                
                TextField("Email", text: $email)
                    .foregroundStyle(Color.white)
                    .frame(width: 350)
                    .bold()
                    .padding(.bottom, 5)
                
                SecureField("Password", text: $password)
                    .foregroundStyle(Color.white)
                    .frame(width: 350)
                    .bold()
                Spacer()
                Button(action: {register()}, label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(Color.white).opacity(0.9)
                        .foregroundStyle(Color.black)
                })
                
                Button(action: {login()}, label: {
                    Text("Already have an account?")
                        .bold()
                        .foregroundStyle(Color.white)
                })
            }
        }
        .onAppear(){
            Auth.auth().addStateDidChangeListener {auth, user in
                // if users logged in
                if user != nil {
                    userIsLoggedIn = true
                }
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
}



#Preview {
    LoginView()
}

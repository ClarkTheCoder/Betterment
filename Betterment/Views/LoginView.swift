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
                .foregroundStyle(Color.white)
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20){
                Text("Welcome")
                    .foregroundStyle(Color.black)
                    .bold()
                    .font(.largeTitle)
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundStyle(Color.white)
                    .textFieldStyle(.plain)
            }
        }
    }
}

#Preview {
    LoginView()
}

//
//  SignIn.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-17.
//

import AuthenticationServices
import SwiftUI

struct SignIn: View {
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userID: String = ""
    
    var body: some View {
        VStack{
            Text("Sign in")
                .font(.largeTitle)
            SignInWithAppleButton(.continue) {requst in
                requst.requestedScopes = [.email, .fullName, ]
            } onCompletion: { result in
                switch result {
                case .success(let auth):
                    
                    switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                        let email = credential.email
                        let firstName = credential.fullName?.givenName
                        let lastName = credential.fullName?.familyName
                        let userID = credential.user
                        
                        self.email = email ?? ""
                        self.userID = userID
                        self.firstName = firstName ?? ""
                        self.lastName = lastName ?? ""
                        
                    default:
                        break;
                    }
                    break
                case.failure(let error):
                    print(error)
                }
            }.frame(width: 200, height: 50)
        }
     
    }
    
}

#Preview {
    SignIn()
}

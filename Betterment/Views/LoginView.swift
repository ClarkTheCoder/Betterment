//
//  LoginView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-08-26.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(Color.white)
                .frame(width: 1000, height: 400)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}

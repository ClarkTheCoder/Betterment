//
//  SideMenuView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-17.
//
import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            NavigationLink(destination: Text("Home")) {
                Text("Home")
                    .padding()
                    .foregroundColor(Theme.primary)
            }
            NavigationLink(destination: Text("Settings")) {
                Text("Settings")
                    .padding()
                    .foregroundColor(Theme.primary)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SideMenuView()
}

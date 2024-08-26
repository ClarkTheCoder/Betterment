//
//  HomeView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-08-26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dateViewModel = DateViewModel()
    @Environment(\.colorScheme) var colorScheme
    var quoteEngine = QuoteEngine()
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack {
            // Main content
            VStack {
                // Display the elapsed time
                Spacer()
                if let elapsedTime = dateViewModel.timeElapsedDisplay {
                    Text(elapsedTime)
                        .padding()
                        .frame(width: 280, height: 280, alignment: .center)
                        .background(Color.clear)
                        .font(.largeTitle)
                        .overlay(
                            Circle()
                                .stroke(Theme.primary, lineWidth: 4)
                        )
                        .foregroundColor(Theme.primary)
                } else {
                    Text("No elapsed time available.")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.clear)
                        .overlay(
                            Circle()
                                .stroke(Theme.primary, lineWidth: 4)
                        )
                }
                Spacer()
                
                Button(action: {
                    dateViewModel.saveCurrentDate()
                }) {
                    Text("Begin")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(colorScheme == .dark ? Color.white : Theme.primary)
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .cornerRadius(12)
                }
                
                Text(quoteEngine.displayQuote())
                    .italic()
                    .padding()
                    .foregroundStyle(colorScheme == .dark ? Color.gray : Color.black)
                Spacer()
            }
            .padding()
            .onAppear {
                dateViewModel.loadSavedDate()
            }
            .blur(radius: isMenuOpen ? 10 : 0)
            .disabled(isMenuOpen)
            
            // Side menu
            if isMenuOpen {
                SideMenuView()
                    .transition(.move(edge: .leading))
            }
        }
        .navigationBarItems(leading: Button(action: {
            withAnimation {
                isMenuOpen.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .tint(Theme.primary)
        })
        .navigationBarTitle("Betterment", displayMode: .inline)
    }
}

#Preview {
    HomeView()
}

//
//  ContentView.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-13.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var dateViewModel = DateViewModel()
    
    var body: some View {
        VStack {
            Button("Better myself.") {
                dateViewModel.saveCurrentDate()
            }
            Text(dateViewModel.lastSavedDate)
            
            Button("Load saved date") {
                dateViewModel.loadSavedDate()
            }
            Text(dateViewModel.lastSavedDate)
            
            Button("Delete saved date") {
                dateViewModel.clearSavedDate()
            }
            Text(dateViewModel.lastSavedDate)
            
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

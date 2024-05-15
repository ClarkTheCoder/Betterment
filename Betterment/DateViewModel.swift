//
//  DateViewModel.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-13.
//

import Foundation

class DateViewModel: ObservableObject {
    @Published var lastSavedDate: String = ""
    
    func saveCurrentDate() {
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "savedDate")
        updateDateDisplay(currentDate)
    }
    
    func updateDateDisplay(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        lastSavedDate = dateFormatter.string(from: date)
    }
    
    func loadSavedDate() {
        if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
            updateDateDisplay(savedDate)
        }
        else {
            lastSavedDate = "No date saved yet"
        }
    }
}

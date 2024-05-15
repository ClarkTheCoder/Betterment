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
        formatDateDisplay(currentDate)
    }
    
    func formatDateDisplay(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        lastSavedDate = dateFormatter.string(from: date)
    }
    
    func loadSavedDate() {
        if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
            formatDateDisplay(savedDate)
        }
        else {
            lastSavedDate = "No date saved"
        }
    }
    
    func clearSavedDate() {
        UserDefaults.standard.removeObject(forKey: "savedDate")
        lastSavedDate = "Date removed"
    }
}

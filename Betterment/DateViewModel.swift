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
        updateLastSavedDateDisplay(currentDate)
    }
    
    func updateLastSavedDateDisplay(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        lastSavedDate = dateFormatter.string(from: date)
    }
}

import Foundation

class DateViewModel: ObservableObject {
    @Published var lastSavedDateFormatted: String = ""
    @Published var lastSavedDate: Date?  // Store the actual Date object

    func saveCurrentDate() {
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "savedDate")
        lastSavedDate = currentDate  // Save the Date object
        formatDateDisplay(currentDate)
    }
    
    func formatDateDisplay(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        lastSavedDateFormatted = dateFormatter.string(from: date)
    }
    
    func loadSavedDate() {
        if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
            lastSavedDate = savedDate  // Load the Date object
            formatDateDisplay(savedDate)
        } else {
            lastSavedDateFormatted = "No date saved"
        }
    }
    
    func clearSavedDate() {
        UserDefaults.standard.removeObject(forKey: "savedDate")
        lastSavedDate = nil  // Clear the Date object
        lastSavedDateFormatted = "Date removed"
    }
    
    // New Method: Calculate the time elapsed since the last saved date
    func timeSinceLastSavedDate() -> String {
        guard let lastDate = lastSavedDate else {
            return "No date was saved previously."
        }
        let elapsedTime = Date().timeIntervalSince(lastDate)
        return formatTimeInterval(elapsedTime)
    }
    
    private func formatTimeInterval(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        return formatter.string(from: interval) ?? "Error calculating time"
    }
}

import Foundation

class DateViewModel: ObservableObject {
    @Published var lastSavedDateFormatted: String = ""
    @Published var lastSavedDate: Date?  // Store the actual Date object
    @Published var timeElapsedDisplay: String?

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
            timeElapsed()
            formatDateDisplay(savedDate)
        } else {
            timeElapsedDisplay = "Start your story"
        }
    }
    
    func clearSavedDate() {
        UserDefaults.standard.removeObject(forKey: "savedDate")
        lastSavedDate = nil  // Clear the Date object
        timeElapsedDisplay = "0"
    }
    
    // returns time elapsed
    func timeElapsed() -> String {
        guard let lastDate = lastSavedDate else {
            timeElapsedDisplay = "No date was saved previously."
            return timeElapsedDisplay!
        }
        let elapsedTime = Date().timeIntervalSince(lastDate)
        timeElapsedDisplay = formatTimeInterval(elapsedTime)
        return timeElapsedDisplay ?? "Error in formatting time"
    }
    
    private func formatTimeInterval(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute]
        return formatter.string(from: interval) ?? "Error calculating time"
    }
}

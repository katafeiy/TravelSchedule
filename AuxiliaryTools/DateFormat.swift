import Foundation

class DateFormatTime {
    
    enum Format: String {
        case dMMMM = "d MMMM"
        case HHmm = "HH:mm"
    }
    
    static func formatDate(_ date: Date, format: Format.RawValue) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}

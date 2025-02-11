import Foundation

final class DateFormatTime {
    
    enum Format: String {
        case dMMMM = "d MMMM"
        case HHmm = "HH:mm"
    }
    
    static func formatDate(_ date: Date, format: Format) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}

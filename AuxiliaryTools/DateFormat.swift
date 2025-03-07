import Foundation

final class DateFormatTime {
    
    enum Format: String {
        case dMMMM = "d MMMM"
        case HHmm = "HH:mm"
    }
    
    static func formatDate(_ date: String?, format: Format) -> String {
        guard let date = date else { return "Некоректная дата" }
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "ru_RU")
        guard let time = formatter.date(from: date) else { return "Некоректная дата" }
        return formatter.string(from: time)
    }
}

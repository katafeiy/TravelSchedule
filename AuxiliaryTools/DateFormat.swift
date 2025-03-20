//import Foundation
//
//final class DateFormatTime {
//
//    enum Format: String {
//        case dMMMM = "d MMMM"
//        case HHmm = "HH:mm"
//    }
//
//    static func formatDate(_ time: String?, format: Format) -> String {
//
//        guard let time = time else { return "" }
//        let inputFormatter = DateFormatter()
//        guard let timeDate = inputFormatter.date(from: time) else { return "" }
//        let outputFormatter = DateFormatter()
//        outputFormatter.dateFormat = format.rawValue
//        outputFormatter.locale = Locale(identifier: "ru_RU")
//        return outputFormatter.string(from: timeDate)
//    }
//}

import Foundation

final class DateFormatTime {
    
    enum Format: String {
        case dMMMM = "d MMMM"
        case HHmm = "HH:mm"
    }
    
    static func formatTime(_ time: String?, format: Format) -> String {
        guard let time = time else { return "" }
        
        let inputFormatter = DateFormatter()
        if time.contains(":") {
            inputFormatter.dateFormat = "HH:mm:ss"
        } else if time.contains("-") {
            inputFormatter.dateFormat = "yyyy-MM-dd"
        } else {
            return ""
        }
        guard let dateObject = inputFormatter.date(from: time) else { return "" }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format.rawValue
        outputFormatter.locale = Locale(identifier: "ru_RU")
        
        return outputFormatter.string(from: dateObject)
    }
}

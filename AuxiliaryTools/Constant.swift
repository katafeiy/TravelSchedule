enum Constant {
    
    case apikey
    case isDarkMode
    case YPUAUrl
    
    var stringValue: String {
        
        return switch self {
        case .apikey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        case .isDarkMode: "isDarkMode"
        case .YPUAUrl: "https://yandex.ru/legal/practicum_offer/"
            
        }
    }
}

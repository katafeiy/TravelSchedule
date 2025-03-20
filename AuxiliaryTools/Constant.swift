enum Constant {
    
    case apikey
    case isDarkMode
    
    var stringValue: String {
        switch self {
        case .apikey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        case .isDarkMode: "isDarkMode"
        }
    }
}

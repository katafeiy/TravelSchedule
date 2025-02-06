enum YPUserAgreement {
    
    case YPUAUrl
    
    var stringValue: String {
        switch self {
        case .YPUAUrl:
            return "https://yandex.ru/legal/practicum_offer/"
        }
    }
}


import SwiftUI

struct ErrorModel {
    let title: String
    let image: ImageResource
}

enum AppError {
    case serverError
    case noInternet
    
    var type: ErrorModel {
        switch self {
        case .serverError:
            ErrorModel(title: "Ошибка сервера", image: .serverError)
        case .noInternet:
            ErrorModel(title: "Нет интернета", image: .noInternet)
        }
    }
}

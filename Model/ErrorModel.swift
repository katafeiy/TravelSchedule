import SwiftUI

struct ErrorModel {
    var title: String
    var image: ImageResource
}

enum Errors {
    case serverError
    case noInternet
    
    var type: ErrorModel {
        switch self {
        case .serverError:
            return ErrorModel(title: "Ошибка сервера", image: .serverError)
        case .noInternet:
            return ErrorModel(title: "Нет интернета", image: .noInternet)
        }
    }
}

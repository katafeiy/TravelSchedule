import SwiftUI

class ModelData {
    
    @Published var images: [PreviewImage] = [
        PreviewImage(name: "preview1"),
        PreviewImage(name: "preview2"),
        PreviewImage(name: "preview3"),
        PreviewImage(name: "preview4"),
        PreviewImage(name: "preview5"),
        PreviewImage(name: "preview6"),
        PreviewImage(name: "preview7"),
        PreviewImage(name: "preview8")
    ]
    
    @Published var citys: [Citys] = [
        Citys(name: "Москва"),
        Citys(name: "Санкт-Петербург"),
        Citys(name: "Сочи"),
        Citys(name: "Саратов"),
        Citys(name: "Красноярск"),
        Citys(name: "Омск"),
        Citys(name: "Краснодар"),
        Citys(name: "Новосибирск"),
    ]
    
    @Published var carriers: [Carrier] = [
        Carrier(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), taimInRoute: 20, date: Date()),
        Carrier(carrierName: "ФГК", carrierLogo: Image("fgk"), startTime: Date(), endTime: Date(), taimInRoute: 15, date: Date()),
        Carrier(carrierName: "Урал логистика", carrierLogo: Image("uralLogistika"), startTime: Date(), endTime: Date(), taimInRoute: 18, date: Date()),
        Carrier(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), taimInRoute: 19, date: Date()),
        Carrier(carrierName: "ФГК", carrierLogo: Image("fgk"), startTime: Date(), endTime: Date(), taimInRoute: 14, date: Date()),
        Carrier(carrierName: "Урал логистика", carrierLogo: Image("uralLogistika"), startTime: Date(), endTime: Date(), taimInRoute: 17, date: Date())
    ]
    
    @Published var carriersInfo: [CarrierInfo] = [
        CarrierInfo(logo: Image("RZHD"), name: "ОАО \u{00AB}РЖД\u{00BB}", phoneNumber: "+7 (495) 123-45-67", email: "info@rzhd.ru")
    ]
}

enum MockData: CaseIterable, Hashable {
    
    case moscow
    case santiPetr
    case sochi
    case saratov
    case krasnoyarsk
    case omsk
    case krasnodar
    case novosibirsk
    
    var name: String {
        return switch self {
        case .moscow: "Москва"
        case .santiPetr: "Санкт-Петербург"
        case .sochi: "Сочи"
        case .saratov: "Саратов"
        case .krasnoyarsk: "Красноярск"
        case .omsk: "Омск"
        case .krasnodar: "Краснодар"
        case .novosibirsk: "Новосибирск"
        }
    }
    
    var stations: [Station] {
        return switch self {
        case .moscow: [Station(name: "Белорусский вокзал"),
                       Station(name: "Казанский вокзал"),
                       Station(name: "Киевский вокзал"),
                       Station(name: "Курский вокзал"),
                       Station(name: "Павелецкий вокзал"),
                       Station(name: "Рижский вокзал"),
                       Station(name: "Савеловский вокзал"),
                       Station(name: "Ярославский вокзал")]
            
        case .santiPetr: [Station(name: "Московский вокзал"),
                          Station(name: "Ладожский вокзал"),
                          Station(name: "Витебский вокзал"),
                          Station(name: "Финляндский вокзал"),
                          Station(name: "Балтийский вокзал")]
            
        case .sochi: [Station(name: "Сочинский вокзал"),
                      Station(name: "Адлерский вокзал")]
            
        case .saratov: [Station(name: "Саратов-Пассажирский")]
            
        case .krasnoyarsk: [Station(name: "Красноярск-Пассажирский")]
            
        case .omsk: [Station(name: "Омск-1"), Station(name: "Омск-2")]
            
        case .krasnodar: [Station(name: "Краснодар-Пассажирский")]
            
        case .novosibirsk: [Station(name: "Новосибирск-Пассажирский")]
            
        }
    }
}

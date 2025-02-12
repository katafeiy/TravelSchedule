import SwiftUI

class ModelData {
    
    @Published var images: [Preview] = [
        Preview(name: "preview1"),
        Preview(name: "preview2"),
        Preview(name: "preview3"),
        Preview(name: "preview4"),
        Preview(name: "preview5"),
        Preview(name: "preview6"),
        Preview(name: "preview7"),
        Preview(name: "preview8")
    ]
    
    @Published var carriers: [Carrier] = [
        Carrier(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 20, date: Date()),
        Carrier(carrierName: "ФГК", carrierLogo: Image("fgk"), startTime: Date(), endTime: Date(), timeInRoute: 15, date: Date()),
        Carrier(carrierName: "Урал логистика", carrierLogo: Image("uralLogistika"), startTime: Date(), endTime: Date(), timeInRoute: 18, date: Date()),
        Carrier(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 19, date: Date()),
        Carrier(carrierName: "ФГК", carrierLogo: Image("fgk"), startTime: Date(), endTime: Date(), timeInRoute: 14, date: Date()),
        Carrier(carrierName: "Урал логистика", carrierLogo: Image("uralLogistika"), startTime: Date(), endTime: Date(), timeInRoute: 17, date: Date())
    ]
    
    @Published var carriersInfo: [CarrierInfo] = [
        CarrierInfo(logo: Image("RZHD"), name: "ОАО \u{00AB}РЖД\u{00BB}", phoneNumber: "+7 (495) 123-45-67", email: "info@rzhd.ru")
    ]
    
    static var massive: [City] = [
        City(name: "Москва", stations: [Station(name: "Белорусский вокзал"),
                                        Station(name: "Казанский вокзал"),
                                        Station(name: "Киевский вокзал"),
                                        Station(name: "Курский вокзал"),
                                        Station(name: "Павелецкий вокзал"),
                                        Station(name: "Рижский вокзал"),
                                        Station(name: "Савеловский вокзал"),
                                        Station(name: "Ярославский вокзал")]),
        
        City(name: "Санкт-Петербург", stations: [Station(name: "Московский вокзал"),
                                                 Station(name: "Ладожский вокзал"),
                                                 Station(name: "Витебский вокзал"),
                                                 Station(name: "Финляндский вокзал"),
                                                 Station(name: "Балтийский вокзал")]),
        
        City(name: "Сочи", stations: [Station(name: "Сочинский вокзал"),
                                      Station(name: "Адлерский вокзал")]),
        
        City(name: "Саратов", stations: [Station(name: "Саратов-Пассажирский")]),
        
        City(name: "Красноярск", stations: [Station(name: "Красноярск-Пассажирский")]),
        
        City(name: "Омск", stations: [Station(name: "Омск-1"), Station(name: "Омск-2")]),
        
        City(name: "Краснодар", stations: [Station(name: "Краснодар-Пассажирский")]),
        
        City(name: "Новосибирск", stations: [Station(name: "Новосибирск-Пассажирский")])
    ]
}






//enum Cities: CaseIterable, Hashable {
//    
//    case moscow
//    case santiPetr
//    case sochi
//    case saratov
//    case krasnoyarsk
//    case omsk
//    case krasnodar
//    case novosibirsk
//    
//    var name: City {
//        return switch self {
//        case .moscow: City(name: "Москва")
//        case .santiPetr: City(name: "Санкт-Петербург")
//        case .sochi: City(name: "Сочи")
//        case .saratov: City(name: "Саратов")
//        case .krasnoyarsk: City(name: "Красноярск")
//        case .omsk: City(name: "Омск")
//        case .krasnodar: City(name: "Краснодар")
//        case .novosibirsk: City(name: "Новосибирск")
//        }
//    }
//    
//    var stations: [Station] {
//        return switch self {
//        case .moscow: [Station(name: "Белорусский вокзал"),
//                       Station(name: "Казанский вокзал"),
//                       Station(name: "Киевский вокзал"),
//                       Station(name: "Курский вокзал"),
//                       Station(name: "Павелецкий вокзал"),
//                       Station(name: "Рижский вокзал"),
//                       Station(name: "Савеловский вокзал"),
//                       Station(name: "Ярославский вокзал")]
//            
//        case .santiPetr: [Station(name: "Московский вокзал"),
//                          Station(name: "Ладожский вокзал"),
//                          Station(name: "Витебский вокзал"),
//                          Station(name: "Финляндский вокзал"),
//                          Station(name: "Балтийский вокзал")]
//            
//        case .sochi: [Station(name: "Сочинский вокзал"),
//                      Station(name: "Адлерский вокзал")]
//            
//        case .saratov: [Station(name: "Саратов-Пассажирский")]
//            
//        case .krasnoyarsk: [Station(name: "Красноярск-Пассажирский")]
//            
//        case .omsk: [Station(name: "Омск-1"), Station(name: "Омск-2")]
//            
//        case .krasnodar: [Station(name: "Краснодар-Пассажирский")]
//            
//        case .novosibirsk: [Station(name: "Новосибирск-Пассажирский")]
//            
//        }
//    }
//}
//

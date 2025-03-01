import SwiftUI

final class ModelData: ObservableObject {
    
    static let shared = ModelData()
    
    @Published var stories: [Story] = [
        Story(small: .preview1,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big11,
                                   title: """
                                                    Пожелания дорогому Яндекс.Практикуму
                                                    от всей душы!!! Это самая лучшая 
                                                    платформа для обучения!  
                                                    """,
                                   description: """
                                                    Привет, практикум! Дорогой практикум
                                                    я очень тебе благодарен что ты меня
                                                    научил программировать на SwiftUI!
                                                    """),
                      ContentStory(big: .big12,
                                   title: """
                                                    Пожелания дорогому Яндекс.Практикуму
                                                    от всей душы!!! Это самая лучшая 
                                                    платформа для обучения!   
                                                    """,
                                   description: """
                                                    Привет, практикум! Дорогой практикум
                                                    я очень тебе благодарен что ты меня
                                                    научил программировать на SwiftUI!
                                                    """),
                      ContentStory(big: .big13,
                                   title: """
                                                    Пожелания дорогому Яндекс.Практикуму
                                                    от всей душы!!! Это самая лучшая 
                                                    платформа для обучения!   
                                                    """,
                                   description: """
                                                    Привет, практикум! Дорогой практикум
                                                    я очень тебе благодарен что ты меня
                                                    научил программировать на SwiftUI!
                                                    """)]),
        Story(small: .preview2,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big21,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big22,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big23,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview3,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big31,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big32,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big33,
                                   title: """
                                                    Пожелания дорогому Яндекс.Практикуму
                                                    от всей душы!!! Это самая лучшая 
                                                    платформа для обучения!   
                                                    """,
                                   description: """
                                                    Привет, практикум! Дорогой практикум
                                                    я очень тебе благодарен что ты меня
                                                    научил программировать на SwiftUI!
                                                    """)]),
        Story(small: .preview4,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big41,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big42,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview5,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big51,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big52,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview6,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big61,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big62,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview7,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big71,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big72,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview8,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big81,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big82,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
        Story(small: .preview9,
              title: """
                    Яндекс.Практикум
                    это лучшая онлайн-школа
                    """,
              isViewed: false,
              story: [ContentStory(big: .big91,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """),
                      ContentStory(big: .big92,
                                   title: """
                                                     Пожелания дорогому Яндекс.Практикуму
                                                     от всей душы!!! Это самая лучшая 
                                                     платформа для обучения!   
                                                     """,
                                   description: """
                                                     Привет, практикум! Дорогой практикум
                                                     я очень тебе благодарен что ты меня
                                                     научил программировать на SwiftUI!
                                                     """)]),
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
    
    static var cities: [City] = [
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



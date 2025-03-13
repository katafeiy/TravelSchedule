import Foundation

@MainActor
final class PreviewMockData {
    
    static let shared = PreviewMockData()
    
    let stationsMoscow: [Station] = [
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Белорусский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Казанский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Киевский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Курский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Павелецкий вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Рижский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Савеловский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Ярославский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Ленинградский вокзал", longitude: 0.0, transportType: "", latitude: 0.0)
    ]
    let stationsMoscowEmpty: [Station] = [
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "", longitude: 0.0, transportType: "", latitude: 0.0),
        ]
    
    let stationsSanPetersburg: [Station] = [
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Московский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Ладожский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Витебский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Финляндский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Балтийский вокзал", longitude: 0.0, transportType: "", latitude: 0.0)
    ]
    let stationsSanPetersburgEmpty: [Station] = [
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "", longitude: 0.0, transportType: "", latitude: 0.0),
    ]
    
    let settlementMoscow: [Settlement] = [Settlement(title: "Москва", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    let settlementSanPetersburg: [Settlement] = [Settlement(title: "Санкт-Петербург", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    
    let settlementMoscowEmpty: [Settlement] = [Settlement(title: "", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    let settlementSanPetersburgEmpty: [Settlement] = [Settlement(title: "", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    
    @Published var carrierMock: [Carrier] = [
        Carrier(isTransfer: true, carrierName: "RZHD", carrierLogo: "", startTime: "21:30", endTime: "5:20", timeInRoute: 55, date: "16 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: ""),
        Carrier(isTransfer: false, carrierName: "RZHD", carrierLogo: "", startTime: "14:30", endTime: "21:20", timeInRoute: 55, date: "18 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: "")
        ]
    
    
    
    
    
    let carrier = Carrier(
        isTransfer: false,
        carrierName: "ОАО \u{00AB}РЖД\u{00BB}",
        carrierLogo: "",
        startTime: "",
        endTime: "",
        timeInRoute: 0,
        date: "",
        email: "info@rzhd.ru",
        phoneNumber: "+7 (495) 123-45-67",
        logo: ""
    )
}

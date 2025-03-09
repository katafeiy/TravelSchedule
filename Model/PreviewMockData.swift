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
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Ярославский вокзал", longitude: 0.0, transportType: "", latitude: 0.0)
    ]
    
    let stationsSanPetersburg: [Station] = [
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Московский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Ладожский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Витебский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Финляндский вокзал", longitude: 0.0, transportType: "", latitude: 0.0),
        Station(direction: "", codes: StationCodes(yandexCode: "", esrCode: ""), stationType: "", title: "Балтийский вокзал", longitude: 0.0, transportType: "", latitude: 0.0)
    ]
    
    let settlementMoskow: [Settlement] = [Settlement(title: "Москва", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    let settlementSanPetersburg: [Settlement] = [Settlement(title: "Санкт-Петербург", codes: Codes(yandexCode: "", esrCode: ""), stations: [])]
    
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

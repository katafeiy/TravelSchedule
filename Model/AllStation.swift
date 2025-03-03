import Foundation

struct CountryData: Decodable {
    let countries: [Country]
}

struct Country: Decodable {
    let title: String
    let codes: Codes
    let regions: [Region]
}

struct Region: Decodable {
    let title: String
    let codes: Codes?
    let settlements: [Settlement]
}

struct Settlement: Decodable, Hashable, Equatable {
    let title: String
    let codes: Codes?
    let stations: [Station]
}

struct Station: Decodable, Hashable, Equatable {
    let direction: String?
    let codes: StationCodes
    let stationType: String
    let title: String
    let longitude: Double
    let transportType: String
    let latitude: Double

    enum CodingKeys: String, CodingKey {
        case direction, codes, title, longitude, latitude
        case stationType = "station_type"
        case transportType = "transport_type"
    }
}

struct Codes: Decodable, Hashable, Equatable {
    let yandexCode: String?
    let esrCode: String?

    enum CodingKeys: String, CodingKey {
        case yandexCode = "yandex_code"
        case esrCode = "esr_code"
    }
}

struct StationCodes: Decodable, Hashable, Equatable {
    let yandexCode: String?
    let esrCode: String?

    enum CodingKeys: String, CodingKey {
        case yandexCode = "yandex_code"
        case esrCode = "esr_code"
    }
}


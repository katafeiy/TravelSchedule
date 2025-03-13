import Foundation

// Главная структура для всего ответа
struct ScheduleResponse: Codable, Sendable {
    let pagination: Pagination?
    let intervalSegments: [IntervalSegment]?
    let segments: [Segment]?
    let search: Search?
}

// Модель пагинации
struct Pagination: Codable, Sendable {
    let total: Int?
    let limit: Int?
    let offset: Int?
}

// Интервальный сегмент
struct IntervalSegment: Codable, Sendable {
    let from: StationResponse?
    let thread: Thread?
    let departurePlatform: String?
    let stops: String?
    let departureTerminal: String?
    let to: StationResponse?
    let hasTransfers: Bool?
    let ticketsInfo: TicketsInfo?
    let duration: Int?
    let arrivalTerminal: String?
    let startDate: String?
    let arrivalPlatform: String?

    enum CodingKeys: String, CodingKey {
        case from, thread, stops, to, duration
        case departurePlatform = "departure_platform"
        case departureTerminal = "departure_terminal"
        case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
        case arrivalTerminal = "arrival_terminal"
        case startDate = "start_date"
        case arrivalPlatform = "arrival_platform"
    }
}

// Сегмент маршрута
struct Segment: Codable, Sendable {
    let arrival: String?
    let from: StationResponse?
    let thread: Thread?
    let departurePlatform: String?
    let departure: String?
    let stops: String?
    let departureTerminal: String?
    let to: StationResponse?
    let hasTransfers: Bool?
    let ticketsInfo: TicketsInfo?
    let duration: Int?
    let arrivalTerminal: String?
    let startDate: String?
    let arrivalPlatform: String?

    enum CodingKeys: String, CodingKey {
        case arrival, from, thread, departure, stops, to, duration
        case departurePlatform = "departure_platform"
        case departureTerminal = "departure_terminal"
        case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
        case arrivalTerminal = "arrival_terminal"
        case startDate = "start_date"
        case arrivalPlatform = "arrival_platform"
    }
}

// Станция
struct StationResponse: Codable, Sendable {
    let code: String?
    let title: String?
    let popularTitle: String?
    let shortTitle: String?
    let transportType: String?
    let type: String?
    let stationType: String?
    let stationTypeName: String?

    enum CodingKeys: String, CodingKey {
        case code, title, type
        case popularTitle = "popular_title"
        case shortTitle = "short_title"
        case transportType = "transport_type"
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
    }
}

// Поток (рейс)
struct Thread: Codable, Sendable {
    let uid: String?
    let title: String?
    let interval: Interval?
    let number: String?
    let shortTitle: String?
    let threadMethodLink: String?
    let carrier: CarrierResponse?
    let transportType: String?
    let vehicle: String?
    let transportSubtype: TransportSubtype?
    let expressType: String?

    enum CodingKeys: String, CodingKey {
        case uid, title, interval, number, carrier, vehicle
        case shortTitle = "short_title"
        case threadMethodLink = "thread_method_link"
        case transportType = "transport_type"
        case transportSubtype = "transport_subtype"
        case expressType = "express_type"
    }
}

// Интервал рейса
struct Interval: Codable, Sendable {
    let density: String?
    let endTime: String?
    let beginTime: String?

    enum CodingKeys: String, CodingKey {
        case density
        case endTime = "end_time"
        case beginTime = "begin_time"
    }
}

// Перевозчик
struct CarrierResponse: Codable, Sendable {
    let code: Int?
    let contacts: String?
    let url: String?
    let logoSvg: String?
    let title: String
    let phone: String?
    let codes: CarrierCodes?
    let address: String?
    let logo: String?
    let email: String?

    enum CodingKeys: String, CodingKey {
        case code, contacts, url, title, phone, codes, address, logo, email
        case logoSvg = "logo_svg"
    }
}

// Коды перевозчика
struct CarrierCodes: Codable, Sendable {
    let icao: String?
    let sirena: String?
    let iata: String?
}

// Подтип транспорта
struct TransportSubtype: Codable, Sendable {
    let color: String?
    let code: String?
    let title: String?
}

// Информация о билетах
struct TicketsInfo: Codable, Sendable {
    let etMarker: Bool?
    let places: [TicketPlace]?

    enum CodingKeys: String, CodingKey {
        case etMarker = "et_marker"
        case places
    }
}

// Место в билете
struct TicketPlace: Codable, Sendable {
    let currency: String?
    let price: Price?
    let name: String?
}

// Цена
struct Price: Codable, Sendable {
    let cents: Int?
    let whole: Int?
}

// Данные поиска
struct Search: Codable, Sendable {
    let date: String?
    let to: SettlementResponse?
    let from: SettlementResponse?
}

// Населённый пункт
struct SettlementResponse: Codable, Sendable {
    let code: String?
    let type: String?
    let popularTitle: String?
    let shortTitle: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case code, type, title
        case popularTitle = "popular_title"
        case shortTitle = "short_title"
    }
}


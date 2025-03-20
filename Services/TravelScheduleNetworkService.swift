import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

protocol TravelNetworkServiceProtocol {
    func getScheduleRouteBetweenStation(from: String, to: String) async throws -> TypeAliases.ScheduleRouteBetweenStation
    func getScheduleRouteByStation(station: String) async throws -> TypeAliases.ScheduleRouteByStation
    func getStationsByThread(uid: String) async throws -> TypeAliases.StationsByThread
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> TypeAliases.NearestStations
    func getNearestSettlement(lat: Double,lng: Double)async throws -> TypeAliases.NearestSettlement
    func getCarrierInfo(code: Int)async throws -> TypeAliases.CarrierInfo
    func getAllStationsList() async throws -> TypeAliases.AllStationsList
    func getCopyright() async throws -> TypeAliases.Copyright
}

final class TravelNetworkService: TravelNetworkServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    // MARK: Расписание рейсов между станциями
    
    func getScheduleRouteBetweenStation(from: String, to: String) async throws -> TypeAliases.ScheduleRouteBetweenStation {
        
        let response = try await client.getScheduleRouteBetweenStation(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
    
    // MARK: Расписание рейсов по станции
    
    func getScheduleRouteByStation(station: String) async throws -> TypeAliases.ScheduleRouteByStation {
        
        let response = try await client.getScheduleRouteByStation(query: .init(
            apikey: apikey,
            station: station
        ))
        return try response.ok.body.json
    }
    
    // MARK: Список станций следования
    
    func getStationsByThread(uid: String) async throws -> TypeAliases.StationsByThread {
        
        let response = try await client.getStationsByThread(query: .init(
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
    
    // MARK: Список ближайших станций
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> TypeAliases.NearestStations {
        
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    // MARK: Ближайший город
    
    func getNearestSettlement(lat: Double, lng: Double) async throws -> TypeAliases.NearestSettlement {
        
        let response = try await client.getNearestSettlement(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
    
    // MARK: Информация о перевозчике
    
    func getCarrierInfo(code: Int) async throws -> TypeAliases.CarrierInfo {
        
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
    
    // MARK: Список всех доступных станций
    
    func getAllStationsList() async throws -> TypeAliases.AllStationsList {
        
        let response = try await client.getAllStationsList(query: .init(apikey: apikey))
        let sequence = try response.ok.body.text_html_charset_utf_hyphen_8
        let data = try await Data(collecting: sequence, upTo: 40 * 1024 * 1024)
        let allStations = try JSONDecoder().decode(TypeAliases.AllStationsList.self, from: data)
        return allStations
    }
    
    // MARK: Копирайт Яндекс Расписаний
    
    func getCopyright() async throws -> TypeAliases.Copyright {
        
        let response = try await client.getCopyright(query: .init( apikey: apikey))
        return try response.ok.body.json
    }
}


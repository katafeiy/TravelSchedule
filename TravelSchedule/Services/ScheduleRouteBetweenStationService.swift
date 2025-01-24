import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleRouteBetweenStation = Components.Schemas.ScheduleRouteBetweenStation

protocol ScheduleRouteBetweenStationServiceProtocol {
    func getScheduleRouteBetweenStation(
        from: String,
        to: String
    ) async throws -> ScheduleRouteBetweenStation
}

final class ScheduleRouteBetweenStationService: ScheduleRouteBetweenStationServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getScheduleRouteBetweenStation(from: String, to: String) async throws -> ScheduleRouteBetweenStation {
        
        let response = try await client.getScheduleRouteBetweenStation(query: .init(apikey: apikey, from: from, to: to))
        
        return try response.ok.body.json
    }
}

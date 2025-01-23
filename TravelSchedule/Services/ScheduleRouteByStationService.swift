import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleRouteByStation = Components.Schemas.ScheduleRouteByStation

protocol ScheduleRouteByStationServiceProtocol {
    func getScheduleRouteByStation(
        station: String
    ) async throws -> ScheduleRouteByStation
}

final class ScheduleRouteByStationService: ScheduleRouteByStationServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getScheduleRouteByStation(station: String) async throws -> ScheduleRouteByStation {
        
        let response = try await client.getScheduleRouteByStation(query: .init(
            
            apikey: apikey,
            station: station
        ))
        return try response.ok.body.json
    }
}

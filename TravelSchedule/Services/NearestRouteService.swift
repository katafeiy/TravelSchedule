import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestRoute = Components.Schemas.Route

protocol NearestRouteServiceProtocol {
    func getNearestStations(
        station: String
    ) async throws -> NearestRoute
}

final class NearestRouteService: NearestRouteServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getNearestStations(station: String) async throws -> NearestRoute {
        
        let response = try await client.getNearestRoute(query: .init(
            
            apikey: apikey,
            station: station
        ))
        return try response.ok.body.json
    }
}

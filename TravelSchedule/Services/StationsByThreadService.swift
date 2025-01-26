import OpenAPIRuntime
import OpenAPIURLSession

typealias StationsByThread = Components.Schemas.StationsByThread

protocol StationsByThreadServiceProtocol {
    func getStationsByThread(
        uid: String
    ) async throws -> StationsByThread
}

final class StationsByThreadService: StationsByThreadServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getStationsByThread(uid: String) async throws -> StationsByThread {
        
        let response = try await client.getStationsByThread(query: .init(
            
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}

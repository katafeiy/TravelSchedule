import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(
        lat: Double,
        lng: Double,
        distance: Int
    ) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        
        let response = try await client.getNearestStations(query: .init(
            
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}

func stations() throws {
    let client = Client(
        serverURL: try Servers.Server1.url(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
    )
    
    Task {
        let stations = try await service.getNearestStations(lat: 52.520008, lng: 13.404954, distance: 50)
        print(stations)
    }
}

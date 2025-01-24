import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

typealias AllStationsList = Components.Schemas.AllStationsList

protocol AllStationsListServiceProtocol {
    func getAllStationsList() async throws -> AllStationsList
}

final class AllStationsListService: AllStationsListServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getAllStationsList() async throws -> AllStationsList {
        
        let response = try await client.getAllStationsList(query: .init(apikey: apikey))
        
        let sequence = try response.ok.body.text_html_charset_utf_hyphen_8
        
        let data = try await Data(collecting: sequence, upTo: 40 * 1024 * 1024)
        
        let allStations = try JSONDecoder().decode(AllStationsList.self, from: data)
        
        return allStations
    }
}

import OpenAPIRuntime
import OpenAPIURLSession

typealias CarrierInfo = Components.Schemas.CarrierInfo
protocol CarrierInfoServiceProtocol {
    func getCarrierInfo(
        code: Int
    )
    async throws -> CarrierInfo
}

final class CarrierInfoService: CarrierInfoServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apikey = apiKey
    }
    
    func getCarrierInfo(code: Int) async throws -> CarrierInfo {
        
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
}

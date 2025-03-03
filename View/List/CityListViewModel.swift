import SwiftUI

@MainActor
final class CityListViewModel: ObservableObject {
    
    @Published var data: [Settlement] = []
    
    func getCity() async throws {
        
        data = try await TravelScheduleNetworkModel.shared.allStations().countries.first(where: { $0.title == "Россия" })?.regions.flatMap( \.settlements ) ?? []
        
    }
    
}

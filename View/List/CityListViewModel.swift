import Foundation

@MainActor
final class CityListViewModel: ObservableObject {
    
    @Published var data: [Settlement] = []
    @Published var searchString: String = ""
    
    var searchResults: [Settlement] {
        searchString.isEmpty
        ? data
        : data.filter { $0.title.lowercased().contains(searchString.lowercased())}
    }
    
    func getCity() async throws {
        
        do {
            let allStations = try await TravelScheduleNetworkModel.shared.allStations()
            guard let russia = allStations.countries.first(where: { $0.title == "Россия" }) else {
                print("Error: Country not found")
                return
            }
            data = russia.regions.flatMap( \.settlements )
            data.sort { ($0.title < $1.title) && (!$0.title.isEmpty && !$1.title.isEmpty) }
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}





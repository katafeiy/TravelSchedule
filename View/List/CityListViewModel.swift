import Foundation

@MainActor
final class CityListViewModel: ObservableObject {
    
    @Published var settlements: [Settlement] = []
    @Published var searchString: String = ""
    private var isLoaded: Bool = false
    
    var searchResults: [Settlement] {
        searchString.isEmpty
        ? settlements
        : settlements.filter { $0.title.lowercased().contains(searchString.lowercased())}
    }
    
    func getCity() async throws {
        
        guard !isLoaded else { return }
        isLoaded = true
        
        do {
            let allStations = try await TravelScheduleNetworkModel.shared.allStations()
            guard let russia = allStations.countries.first(where: { $0.title == "Россия" }) else {
                print("Error: Country not found")
                return
            }
            settlements = russia.regions.flatMap( \.settlements )
            settlements.sort { ($0.title < $1.title) && (!$0.title.isEmpty && !$1.title.isEmpty) }
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}

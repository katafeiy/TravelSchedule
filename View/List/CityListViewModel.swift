import Foundation

final class CityListViewModel: ObservableObject {
    
    @Published var settlements: [Settlement] = CacheDataBase.shared.settlements
    @Published var searchString: String = ""
    
    var searchResults: [Settlement] {
        searchString.isEmpty
        ? settlements
        : settlements.filter { $0.title.lowercased().contains(searchString.lowercased())}
    }
}

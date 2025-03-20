import Foundation

final class StationsListViewModel: ObservableObject {
    
    @Published var searchString: String = ""
    @Published var stations: [Station]
    
    var searchResults: [Station] {
        searchString.isEmpty
        ? stations
        : stations.filter { $0.title.lowercased().contains(searchString.lowercased())}
    }
    
    init(stations: [Station]) {
        self.stations = stations
    }
}

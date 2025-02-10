import SwiftUI

struct StationsListView: View {
    
    @State private var searchString: String = ""
    @State var cityStations: [Station]
    
    var onStationSelected: (String) -> Void
    
    
    
    var searchResults: [Station] {
        if searchString.isEmpty {
            return cityStations
        } else {
            return cityStations.filter {
                $0.name.contains(searchString)
            }
        }
    }
    
    var body: some View {
        
        VStack {
            SearchBar(searchText: $searchString)
            ForEach(searchResults) { station in
                Button {
                    onStationSelected(station.name)
                } label: {
                    HStack {
                        Text(station.name)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.ypBlack)
                    .padding(16)
                }
            }
        }
        .navigationTitle("Список станций")
        Spacer()
    }
}


#Preview {
    StationsListView(cityStations: MockData.moscow.stations, onStationSelected: { _ in })
}

import SwiftUI

struct CitysListView: View {
    @Binding var selectedCity: String
    var onStationSelected: (String) -> Void
    
    @State private var searchString: String = ""
    
    var searchResults: [MockData] {
        if searchString.isEmpty {
            return MockData.allCases
        } else {
            return MockData.allCases.filter {
                $0.name.contains(searchString)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(searchText: $searchString)
                if searchResults.isEmpty {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                } else {
                    ForEach(searchResults, id: \.self) { city in
                        NavigationLink(destination: StationsListView(cityStations: city.stations, onStationSelected: { stationName in
                            selectedCity = city.name
                            onStationSelected(stationName)
                        })) {
                            HStack {
                                Text(city.name)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("Выберите город")
    }
}

#Preview {
    CitysListView(selectedCity: .constant(""), onStationSelected: { _ in })
}


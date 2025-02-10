import SwiftUI

struct CitysListView: View {
    
    var onSelection: (String, String) -> Void
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
        VStack {
            SearchBar(searchText: $searchString)
            if searchResults.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                ForEach(searchResults, id: \.self) { city in
                    NavigationLink(value: city) {
                        HStack {
                            Text(city.name)
                                .foregroundColor(.ypBlack)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.ypBlack)
                        }
                        .padding()
                    }
                    .navigationDestination(for: MockData.self) { city in
                        StationsListView(cityStations: city.stations) { station in
                            onSelection(city.name, station)
                        }
                    }
                }
                .navigationTitle("Выберите город")
            }
        }
        Spacer()
    }
}

#Preview {
    CitysListView(onSelection: { _, _  in })
}


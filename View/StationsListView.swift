import SwiftUI

struct StationsListView: View {
    
    @Environment(\.presentationMode) var presentationMode
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
        NavigationStack {
            VStack {
                SearchBar(searchText: $searchString)
                ForEach(searchResults) { station in
                    Button {
                        onStationSelected(station.name)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text(station.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.black)
                        .padding(16)
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Список станций")
    }
}


#Preview {
    StationsListView(cityStations: MockData.moscow.stations, onStationSelected: { _ in })
}

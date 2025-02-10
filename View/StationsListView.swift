import SwiftUI

struct StationsListView: View {
    
    @Environment(\.dismiss) private var dismiss
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
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
                Text("Выбор станции")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            .padding(.horizontal, 10)
     
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
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}


#Preview {
    StationsListView(cityStations: MockData.moscow.stations, onStationSelected: { _ in })
}

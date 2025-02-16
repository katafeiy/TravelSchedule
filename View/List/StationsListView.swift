import SwiftUI

struct StationsListView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @State private var searchString: String = ""
    
    var city: String
    var stations: [Station]
    @Binding var selectedStation: String
    var isFrom: Bool
    
    var searchResults: [Station] {
        searchString.isEmpty
        ? stations
        : stations.filter { $0.name.lowercased().contains(searchString.lowercased())}
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    navModel.pop(.schedule(.void))
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
            if searchResults.isEmpty, !searchString.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if searchResults.isEmpty {
                    ErrorView(errors: .serverError)
                } else {
                    List(searchResults) { station in
                        Button {
                            selectedStation = "\(city) (\(station.name))"
                            navModel.popRoot(.schedule(.toRoot))
                        } label: {
                            HStack {
                                Text(station.name)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .padding(.vertical)
                        }
                    }
                    .animation(.easeInOut, value: searchResults)
                    .listStyle(.plain)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    NavigationStack {
        StationsListView(city: "", stations: ModelData.cities.first!.stations, selectedStation: .constant(""), isFrom: true)
            .environmentObject(NavigationModel())
    }
}

#Preview {
    NavigationStack{
        StationsListView(city: "", stations: [], selectedStation: .constant(""), isFrom: false)
            .environmentObject(NavigationModel())
    }
}

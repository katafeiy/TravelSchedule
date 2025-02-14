import SwiftUI

struct CitysListView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @State private var searchString: String = ""
    
    var data: [City] = []
    @Binding var selectedCity: String
    var isFrom: Bool
    
    var searchResults: [City] {
        searchString.isEmpty
        ? data
        : data.filter { $0.name.lowercased().contains(searchString.lowercased())}
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    navModel.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
                Text("Выбор города")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            .padding(.horizontal, 10)
            
            SearchBar(searchText: $searchString)
            
            if searchResults.isEmpty {
                if searchResults.isEmpty && searchString.isEmpty {
                    ErrorView(errors: .noInternet)
                } else {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
            } else {
                List(searchResults, id: \.self) { city in
                    Button {
                        navModel.push(.station(city.name, city.stations, isFrom))
                    } label: {
                        HStack {
                            Text(city.name)
                                .foregroundColor(.ypBlack)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.ypBlack)
                        }
                        .padding(.vertical)
                    }
                }
                //                .navigationDestination(for: Screen.self) { screen in
                //                    Route.destination(screen)
                //                   Route.destination(screen, station: ModelData.cities.first!.stations) { station in
                //                   StationsListView(cityStations: city.stations) { station in
                //                       output = "\(ModelData.cities.first!.name) (\(station))"
                //                       navModel.popRoot()
                //                    }
                //                }
                .animation(.easeInOut, value: searchResults)
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    NavigationStack {
        CitysListView(data: ModelData.cities, selectedCity: .constant(""), isFrom: true)
            .environmentObject(NavigationModel())
    }
}

#Preview {
    NavigationStack {
        CitysListView(data: [], selectedCity: .constant(""), isFrom: false)
            .environmentObject(NavigationModel())
    }
}



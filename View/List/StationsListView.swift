import SwiftUI

struct StationsListView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject private var viewModel: StationsListViewModel
   
    @Binding var selectedStation: Station
    var isFrom: Bool
    
    init(settlement: Settlement, stations: [Station], selectedStation: Binding<Station>, isFrom: Bool) {
        self._selectedStation = selectedStation
        self.isFrom = isFrom
        _viewModel = StateObject(wrappedValue: StationsListViewModel(stations: stations))
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
            
            SearchBar(searchText: $viewModel.searchString)
            if viewModel.searchResults.isEmpty, !viewModel.searchString.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if viewModel.searchResults.isEmpty {
                    ErrorView(errors: .serverError)
                } else {
                    List(viewModel.searchResults, id: \.self) { station in
                        Button {
                            selectedStation = station // "\(city.title) (\(station.title))"
                            navModel.popRoot(.schedule(.toRoot))
                        } label: {
                            HStack {
                                Text(station.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .padding(.vertical)
                        }
                    }
                    .animation(.easeInOut, value: viewModel.searchResults)
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
        StationsListView(
            settlement: PreviewMockData.shared.settlementMoskow[0],
            stations: PreviewMockData.shared.stationsMoscow ,
            selectedStation: .constant(PreviewMockData.shared.stationsMoscow[0]),
            isFrom: true
        )
            .environmentObject(NavigationModel())
    }
}

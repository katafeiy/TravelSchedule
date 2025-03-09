import SwiftUI

struct CitysListView: View {
    
    @StateObject private var viewModel = CityListViewModel()
    @EnvironmentObject var navModel: NavigationModel
    @Binding var selectedCity: Station
    var isFrom: Bool
    
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
                Text("Выбор города")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            .padding(.horizontal, 10)
            
            SearchBar(searchText: $viewModel.searchString)
            
            if viewModel.searchResults.isEmpty {
                if viewModel.searchResults.isEmpty && viewModel.searchString.isEmpty {
                    ErrorView(errors: .noInternet)
                } else {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
            } else {
                List(viewModel.searchResults, id: \.self) { settlement in
                    Button {
                        navModel.push(.schedule(.station(settlement, settlement.stations, isFrom)))
                    } label: {
                        HStack {
                            Text(settlement.title)
                                .foregroundColor(.ypBlack)
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
        .navigationBarBackButtonHidden(true)
        .onAppear()  {
            Task {
                do {
                    try await viewModel.getCity()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    
    NavigationStack {
        CitysListView(selectedCity: .constant(PreviewMockData.shared.stationsMoscow[0]), isFrom: true)
            .environmentObject(NavigationModel())
    }
}



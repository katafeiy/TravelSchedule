import SwiftUI

struct CitysListView: View {
    
    @StateObject private var viewModel = CityListViewModel()
    @EnvironmentObject var navModel: NavigationModel
    @State private var searchString: String = ""
    
    
    @Binding var selectedCity: String
    var isFrom: Bool
    
    var searchResults: [Settlement] {
        searchString.isEmpty
        ? viewModel.data
        : viewModel.data.filter { $0.title.lowercased().contains(searchString.lowercased())}
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
                        navModel.push(.schedule(.station(city.title, city.stations, isFrom)))
                    } label: {
                        HStack {
                            Text(city.title)
                                .foregroundColor(.ypBlack)
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
        CitysListView(selectedCity: .constant(""), isFrom: true)
            .environmentObject(NavigationModel())
    }
}

#Preview {
    NavigationStack {
        CitysListView(selectedCity: .constant(""), isFrom: false)
            .environmentObject(NavigationModel())
    }
}



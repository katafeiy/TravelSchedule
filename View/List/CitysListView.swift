import SwiftUI

struct CitysListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var searchString: String = ""
    
    var onSelection: (String, String) -> Void
    
    var data: [City] = []
    
    var searchResults: [City] {
        if searchString.isEmpty {
            return data
        } else {
            return data.filter {
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
                Text("Выбор города")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            .padding(.horizontal, 10)
            
            SearchBar(searchText: $searchString)
            if searchResults.isEmpty, !searchString.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if searchResults.isEmpty {
                    ErrorsView(errors: .noInternet)
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
                        .navigationDestination(for: City.self) { city in
                            StationsListView(cityStations: city.stations) { station in
                                onSelection(city.name, station)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    CitysListView(onSelection: { _, _  in }, data: ModelData.massive)
}
#Preview {
    CitysListView(onSelection: { _, _  in }, data: [])
}



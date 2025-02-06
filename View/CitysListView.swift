import SwiftUI

struct CitysListView: View {
    
    @State private var searchString: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCity: String
    
    var searchResults: [Citys] {
        if searchString.isEmpty {
            return ModelData().citys
        } else {
            return ModelData().citys.filter {
                $0.name.contains(searchString)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchString)
                ForEach(searchResults) { city in
                    Button {
                        selectedCity = city.name
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        NavigationLink(destination: Text("Выбор станции")) {
                            Text(city.name)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Выберите город")
    }
    
}

#Preview {
    CitysListView(selectedCity: .constant(""))
}

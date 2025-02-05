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
        SearchBar(searchText: $searchString)
        List(searchResults) { city in
            Button {
                selectedCity = city.name
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text(city.name)
                    .foregroundColor(.black)
            }
        }
        .ignoresSafeArea(.all)
        .navigationTitle(Text("Выберите город"))
    }
}

#Preview {
    CitysListView(selectedCity: .constant(""))
}

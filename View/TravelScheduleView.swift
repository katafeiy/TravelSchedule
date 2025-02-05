import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var viewModel = TravelScheduleViewModel()
    
    @State private var from: String = "Откуда"
    @State private var toIn: String = "Куда"
    @State private var isSelectedFrom: Bool = false
    @State private var isSelectedTo: Bool = false
    
    var body: some View {
        
        let rows = [GridItem(.flexible())]
        
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(ModelData().images) { imageItem in
                            PreviewRow(imageName: imageItem.name)
                        }
                    }
                }
                ZStack {
                    HStack {
                        VStack (alignment: .leading, spacing: 15) {
                            NavigationLink(destination: CitysListView(selectedCity: $from)) {
                                Text(from)
                                    .foregroundColor((from == "Откуда" || from == "Куда") ? .gray : .black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 20)
                                    .padding(.leading, 20)
                            }
                            Divider()
                            NavigationLink(destination: CitysListView(selectedCity: $toIn)) {
                                Text(toIn)
                                    .foregroundColor((toIn == "Куда" || toIn == "Откуда") ? .gray : .black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 20)
                                    .padding(.leading, 20)
                            }
                        }
                        .background(Color.white)
                        .frame(width: 259, height: 96)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        Button {
                            swap(&from, &toIn)
                        } label: {
                            Image("change")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 36, height: 36)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .clipShape(Circle())
                    }
                    .frame(width: 311, height: 96)
                }
                .frame(width: 343, height: 128)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Spacer()
            Button("Request", action: {
                Task {
                    await viewModel.mainRequest()
                }
            })
            .buttonStyle(.borderedProminent)
        }
        .onAppear() {
            
        }
        .padding()
    }
}

#Preview {
    TravelScheduleView()
}

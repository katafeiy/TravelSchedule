import SwiftUI

struct CarrierListView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject private var viewModel = CarrierListViewModel()
    
    let fromStation: Station
    let toStation: Station
    
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
            }
            .padding(.vertical, 10)
            
            Text(fromStation.title + " -> " + toStation.title)
                .font(.system(size: 24, weight: .bold))
                .lineLimit(nil)
            
            ZStack(alignment: .bottom) {
                List(viewModel.carriers) { carrier in
                    Button  {
                        navModel.push(.schedule(.carrierInfo))
                    } label: {
                        CarrierCellView(carrierInfo: carrier)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .padding(.bottom, 16)
                
                Button{
                    navModel.push(.schedule(.filter))
                } label: {
                    Text("Уточнить время")
                        .foregroundColor(.uWhite)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 343, height: 60)
                        .background(.uBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 16)
        .onAppear {
            Task {
                try await viewModel.fetchCarriers(from: fromStation.codes.yandexCode ?? "", to: toStation.codes.yandexCode ?? "")
            }
        }
    }
}

//#Preview {
//
//    NavigationStack {
//        CarrierListView(fromStation: "Санкт-Петербург(Финляндский вокзал)",toStation: "Новосибирск(Новосибирск-Пассажирский)")
//            .environmentObject(NavigationModel())
//    }
//}

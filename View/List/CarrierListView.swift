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
                        .padding(.horizontal, 16)
                }
                Spacer()
            }
            .padding(.vertical, 10)
            
            Text(fromStation.title + " -> " + toStation.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 16)
                .lineLimit(nil)
            
            ZStack(alignment: .bottom) {
                List(viewModel.carriers) { carrier in
                    Button  {
                        navModel.push(.schedule(.carrierInfo(carrier)))
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
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.uWhite)
                        .font(.system(size: 17, weight: .bold))
                        .background(.uBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 16)
                }
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                try await viewModel.fetchCarriers(from: fromStation.codes.yandexCode ?? "", to: toStation.codes.yandexCode ?? "")
            }
        }
    }
}

#Preview {
    
    let station1 = Station(
        direction: "",
        codes: StationCodes(yandexCode: "", esrCode: ""),
        stationType: "",
        title: "Санкт-Петербург(Финляндский вокзал)",
        longitude: 0.0,
        transportType: "",
        latitude: 0.0
    )

    let station2 = Station(
        direction: "",
        codes: StationCodes(yandexCode: "", esrCode: ""),
        stationType: "",
        title: "Новосибирск(Новосибирск-Пассажирский)",
        longitude: 0.0,
        transportType: "",
        latitude: 0.0
    )

    
    NavigationStack {
        CarrierListView(fromStation: station1, toStation: station2)
            .environmentObject(NavigationModel())
    }
}

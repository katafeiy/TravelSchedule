import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var isTabBarHidden: Bool
    @Binding var fromStation: Station
    @Binding var toStation: Station

    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        CitySelectionButton(title: "Откуда", city: fromStation.title, isIndentation: true) {
                            navModel.push(.schedule(.city(true)))
                            isTabBarHidden = true
                        }
                        Divider()
                        CitySelectionButton(title: "Куда", city: toStation.title, isIndentation: false) {
                            navModel.push(.schedule(.city(false)))
                            isTabBarHidden = true
                        }
                    }
                    .background(.uWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    SwapButton{
                        swap(&fromStation, &toStation)
                    }
                }
            }
            .padding(16)
            .background(.uBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            FindButton(isEnabled: !fromStation.title.isEmpty && !toStation.title.isEmpty) {
                navModel.push(.schedule(.carrier(fromStation, toStation)))
                isTabBarHidden = true
            }
        }
    }
}

#Preview {
    
    let station = Station(
        direction: "",
        codes: StationCodes(yandexCode: "", esrCode: ""),
        stationType: "",
        title: "Повелецкий вокзал",
        longitude: 0.0,
        transportType: "",
        latitude: 0.0
    )
    
    NavigationStack {
        FromToInView(isTabBarHidden: .constant(false), fromStation: .constant(station), toStation: .constant(station))
            .environmentObject(NavigationModel())
    }
}

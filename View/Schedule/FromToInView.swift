import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var isTabBarHidden: Bool
    @Binding var fromSettlement: Settlement
    @Binding var toSettlement: Settlement
    @Binding var fromStation: Station
    @Binding var toStation: Station

    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        CitySelectionButton(
                            title: "Откуда",
                            settlementName: fromSettlement.title,
                            stationName: fromStation.title,
                            isIndentation: true
                        ) {
                            navModel.push(.schedule(.settlement(true)))
                            isTabBarHidden = true
                        }
                        Divider()
                        CitySelectionButton(
                            title: "Куда",
                            settlementName: toSettlement.title,
                            stationName: toStation.title,
                            isIndentation: false
                        ) {
                            navModel.push(.schedule(.settlement(false)))
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
    
    NavigationStack {
        FromToInView(
            isTabBarHidden: .constant(false),
            fromSettlement: .constant(PreviewMockData.shared.settlementMoscow[0]),
            toSettlement: .constant(PreviewMockData.shared.settlementSanPetersburg[0]),
            fromStation: .constant(PreviewMockData.shared.stationsMoscow[7]),
            toStation: .constant(PreviewMockData.shared.stationsSanPetersburg[0])
        )
            .environmentObject(NavigationModel())
    }
}

//VStack(alignment: .leading, spacing: 15) {
//      citySelectionButton(title: "Откуда", isFrom: true)
//       Divider()
//       citySelectionButton(title: "Куда", isFrom: false)
// }
//                
//    @ViewBuilder
//    private func citySelectionButton(title: String, isFrom: Bool) -> some View {
//        CitySelectionButton(
//            title: title,
//            settlementName: isFrom ? fromSettlement.title : toSettlement.title,
//            stationName: isFrom ? fromStation.title : toStation.title,
//            isIndentation: isFrom
//        ) {
//            navModel.push(.schedule(.settlement(isFrom)))
//            isTabBarHidden = true
//        }
//    }

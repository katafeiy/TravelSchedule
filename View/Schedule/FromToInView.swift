import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var isTabBarHidden: Bool
    @Binding var fromCity: String
    @Binding var toCity: String

    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        CitySelectionButton(title: "Откуда", city: fromCity, isIndentation: true) {
                            navModel.push(.city(true))
                            isTabBarHidden = true
                        }
                        Divider()
                        CitySelectionButton(title: "Куда", city: toCity, isIndentation: false) {
                            navModel.push(.city(false))
                            isTabBarHidden = true
                        }
                    }
                    .background(.uWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    SwapButton{
                        swap(&fromCity, &toCity)
                    }
                }
            }
            .padding(16)
            .background(.uBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            FindButton(isEnabled: !fromCity.isEmpty && !toCity.isEmpty) {
                navModel.push(.carrier(fromCity, toCity))
                isTabBarHidden = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        FromToInView(isTabBarHidden: .constant(false), fromCity: .constant(""), toCity: .constant(""))
            .environmentObject(NavigationModel())
    }
}

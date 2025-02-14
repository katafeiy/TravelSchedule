import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var isTabBarHidden: Bool
    @State private var fromCity: String = ""
    @State private var toCity: String = ""

    @State private var goToCarrierList: Bool = false
    
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
            .onAppear() {
                isTabBarHidden = false
            }
            FindButton(isEnabled: !fromCity.isEmpty && !toCity.isEmpty) {
                goToCarrierList = true
                isTabBarHidden = true
            }
        }
        .navigationDestination(for: Screen.self) { screen in
            Route.destination(screen, from: $fromCity, toIn: $toCity)
        }
        .navigationDestination(isPresented: $goToCarrierList) {
            CarrierList(isTabBarHidden: $isTabBarHidden, from: fromCity, to: toCity)
        }
    }
}

#Preview {
    NavigationStack {
        FromToInView(isTabBarHidden: .constant(false))
            .environmentObject(NavigationModel())
    }
}

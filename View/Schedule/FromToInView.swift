import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var isTabBarHidden: Bool
    @State private var from: String = ""
    @State private var toIn: String = ""
    @State var goToCarrierList: Bool = false
    
    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        CitySelectionButton(title: "Откуда", city: from, isIndentation: true) {
                            navModel.push(.cityFrom)
                            isTabBarHidden = true
                        }
                        Divider()
                        CitySelectionButton(title: "Куда", city: toIn, isIndentation: false) {
                            navModel.push(.cityTo)
                            isTabBarHidden = true
                        }
                    }
                    .background(.uWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    SwapButton{
                        swap(&from, &toIn)
                    }
                }
            }
            .padding(16)
            .background(.uBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onAppear() {
                isTabBarHidden = false
            }
            FindButton(isEnabled: !from.isEmpty && !toIn.isEmpty) {
                goToCarrierList = true
                isTabBarHidden = true
            }
        }
        .navigationDestination(for: ScreenNames.self) { screenNames in
            switch screenNames {
            case .cityFrom, .cityTo:
                CitysListView { city, station in
                    switch screenNames {
                    case .cityFrom:
                        from = "\(city) (\(station))"
                    case .cityTo:
                        toIn = "\(city) (\(station))"
                    }
                    navModel.popRoot()
                }
            }
        }
        .navigationDestination(isPresented: $goToCarrierList) {
            CarrierList(isTabBarHidden: $isTabBarHidden, from: from, to: toIn)
        }
    }
}

#Preview {
    FromToInView(isTabBarHidden: .constant(false))
}

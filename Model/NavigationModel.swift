import SwiftUI

enum Screen: Hashable {
    case city(Bool)
    case station(String, [Station], Bool)
//    case carrier(Bool, String, String)
    case toRoot
}

final class NavigationModel: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popRoot() {
        path = NavigationPath()
    }
}

struct Route {
    @ViewBuilder
    static func destination(_ screen: Screen, from: Binding<String>, toIn: Binding<String> ) -> some View {
        switch screen {
        case .city(let isFrom):
            CitysListView(data: ModelData.cities, selectedCity: isFrom ? from : toIn, isFrom: isFrom)
        case .station(let city, let stations, let isFrom):
            StationsListView(city: city, stations: stations, selectedStation: isFrom ? from : toIn, isFrom: isFrom)
//        case .carrier(let isHidden, let fromCity, let toCity):
//            CarrierList(isTabBarHidden: isHidden, from: fromCity, to: toCity)
        case .toRoot:
            EmptyView()
        }
    }
}


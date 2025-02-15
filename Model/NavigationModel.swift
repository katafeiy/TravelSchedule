import SwiftUI

enum Screen: Hashable {
    case city(Bool)
    case station(String, [Station], Bool)
    case carrier(String, String)
    case carrierInfo
    case filter
    case userAgreement
    case toRoot
}

final class NavigationModel: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        } else {
            return
        }
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
        case .carrier(let fromCity, let toCity):
            CarrierList(from: fromCity, to: toCity)
        case .carrierInfo:
            CarrierInfoView()
        case .filter:
            FilterView()
        case .userAgreement:
            UserAgreementView()
        case .toRoot:
            EmptyView()
        }
    }
}


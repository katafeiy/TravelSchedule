import SwiftUI

enum Screen: Hashable {
    
    case schedule(Schedule)
    case setting(Setting)
    
    enum Schedule: Hashable {
        case city(Bool)
        case station(Settlement, [Station], Bool)
        case carrier(Station, Station)
        case carrierInfo
        case filter
        case toRoot
        case void 
    }
    
    enum Setting: Hashable {
        case userAgreement
        case toRoot
        case void
    }
}

final class NavigationModel: ObservableObject {
    
    @Published var pathSchedule = NavigationPath()
    @Published var pathSettings = NavigationPath()
    
    func push(_ screen: Screen) {
        switch screen {
        case let .schedule(screen):
            pathSchedule.append(screen)
        case let .setting(screen):
            pathSettings.append(screen)
        }
    }
    
    func pop(_ screen: Screen) {
        switch screen {
        case .schedule:
            guard !pathSchedule.isEmpty else { return }
            pathSchedule.removeLast()
        case .setting:
            guard !pathSettings.isEmpty else { return }
            pathSettings.removeLast()
        }
    }
    
    func popRoot(_ screen: Screen) {
        switch screen {
        case .schedule:
            pathSchedule = NavigationPath()
        case .setting:
            pathSettings = NavigationPath()
        }
    }
}

struct Route {
    
    @ViewBuilder
    static func scheduleFlowDestination(_ screen: Screen.Schedule, from: Binding<Station>, toIn: Binding<Station>) -> some View {
        switch screen {
        case .city(let isFrom):
            CitysListView(selectedCity: isFrom ? from : toIn, isFrom: isFrom)
        case .station(let city, let stations, let isFrom):
            StationsListView(city: city, stations: stations, selectedStation: isFrom ? from : toIn, isFrom: isFrom)
        case .carrier(let fromStation, let toStation):
            CarrierListView(fromStation: fromStation, toStation: toStation)
        case .carrierInfo:
            CarrierInfoView()
        case .filter:
            FilterView()
        case .toRoot, .void:
            EmptyView()
        }
    }
    
    @ViewBuilder
    static func settingFlowDestination(_ screen: Screen.Setting) -> some View {
        switch screen {
        case .userAgreement:
            UserAgreementView()
        case .toRoot, .void:
            EmptyView()
        }
    }
}


import SwiftUI

enum Screen: Hashable {
    
    case schedule(Schedule)
    case setting(Setting)
    case filter(Filter)
    
    enum Schedule: Hashable {
        case settlement(Bool)
        case station([Station], Bool)
        case carrier(Station, Station)
        case carrierInfo(Carrier)
        case toRoot
        case void 
    }
    
    enum Setting: Hashable {
        case userAgreement
        case toRoot
        case void
    }
    
    enum Filter: Hashable {
        case filter
    }
}

@MainActor
final class NavigationModel: ObservableObject {
    
    @Published var pathSchedule = NavigationPath()
    @Published var pathSettings = NavigationPath()
    
    func push(_ screen: Screen) {
        switch screen {
        case let .schedule(screen):
            pathSchedule.append(screen)
        case let .setting(screen):
            pathSettings.append(screen)
        case let .filter(screen):
            pathSchedule.append(screen)
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
        case .filter(_):
            guard !pathSchedule.isEmpty else { return }
            pathSchedule.removeLast()
        }
    }
    
    func popRoot(_ screen: Screen) {
        switch screen {
        case .schedule:
            pathSchedule = NavigationPath()
        case .setting:
            pathSettings = NavigationPath()
        case .filter(_):
            pathSchedule = NavigationPath()
        }
    }
}

@MainActor
struct Route {
    
    @ViewBuilder
    static func scheduleFlowDestination(
        _ screen: Screen.Schedule,
        fromSettlement: Binding<Settlement>,
        from: Binding<Station>,
        toSettlement: Binding<Settlement>,
        toIn: Binding<Station>
    ) -> some View {
        switch screen {
        case .settlement(let isFrom):
            CitysListView(selectedSettlement: isFrom ? fromSettlement : toSettlement, isFrom: isFrom)
        case .station(let stations, let isFrom):
            StationsListView(stations: stations, selectedStation: isFrom ? from : toIn, isFrom: isFrom)
        case .carrier(let fromStation, let toStation):
            CarrierListView(fromStation: fromStation, toStation: toStation)
        case .carrierInfo(let carrier):
            CarrierInfoView(carrier: carrier)
        case .toRoot, .void:
            EmptyView()
        }
    }
    
    @ViewBuilder
    static func filterFlowDestination(
        _ screen: Screen.Filter,
        hasTransfer: Binding<Bool>
    ) -> some View {
        switch screen {
        case .filter:
            FilterView(hasTransfers: hasTransfer)
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


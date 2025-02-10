import SwiftUI

enum ScreenNames: Hashable {
    case cityFrom
    case cityTo
}

class NavigationModel: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ screen: ScreenNames) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popRoot() {
        path = NavigationPath()
    }
}

struct Router {
    @ViewBuilder
    static func destination(for screen: ScreenNames, onSelection: @escaping (String, String) -> Void) -> some View {
        switch screen {
        case .cityFrom:
            CitysListView(onSelection: onSelection)
        case .cityTo:
            CitysListView(onSelection: onSelection)
        }
    }
}

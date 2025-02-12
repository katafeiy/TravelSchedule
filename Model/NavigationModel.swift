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

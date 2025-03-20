import SwiftUI

class TabBarViewModel: ObservableObject {
    
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @Published var selectedTabIndex = 0
    @Published var isTabBarHidden = false
    
}

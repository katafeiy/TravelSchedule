import SwiftUI

@main
struct TravelScheduleApp: App {
    
    @AppStorage(Constant.isDarkMode.stringValue) private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .animation(.easeOut, value: isDarkMode)
        }
    }
}

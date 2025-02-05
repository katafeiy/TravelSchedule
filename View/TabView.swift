import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ZStack {
                TravelScheduleView()
            }
            .tabItem {
                Label("", image: "schedule")
            }
            .toolbarBackground(.visible, for: .tabBar)
            ZStack {
                SettingView()
            }
            .tabItem {
                Label("", image: "settings")
            }
            .toolbarBackground(.visible, for: .tabBar)
        }
        
    }
}

#Preview {
    MainTabView()
}

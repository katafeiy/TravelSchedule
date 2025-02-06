import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        TabView {
            TravelScheduleView()
                .tabItem {
                    Image("schedule")
                        .renderingMode(.template)
                    Text("Расписание")
                }
                .tag(0)
                .toolbarBackground(.visible, for: .tabBar)
            SettingView()
                .tabItem {
                    Image("settings")
                        .renderingMode(.template)
                    Text("Настройки")
                }
                .tag(1)
                .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(selectedTab == 0 ? (isDarkMode ? .white : .black)   : .gray)
    }
}

#Preview {
    TabBarView()
}

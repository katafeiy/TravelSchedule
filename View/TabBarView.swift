//import SwiftUI
//
//struct TabBarView: View {
//    
//    @State private var selectedTab = 0
//    
//    var body: some View {
//        TabView {
//            TravelScheduleView()
//                .tabItem {
//                    Image("schedule")
//                        .renderingMode(.template)
//                    Text("Расписание")
//                }
//                .tag(0)
//                .toolbarBackground(.visible, for: .tabBar)
//            SettingView()
//                .tabItem {
//                    Image("settings")
//                        .renderingMode(.template)
//                    Text("Настройки")
//                }
//                .tag(1)
//                .toolbarBackground(.visible, for: .tabBar)
//        }
//        .accentColor(selectedTab == 0 ? .ypBlack : .uGray)
//    }
//}
//
//#Preview {
//    TabBarView()
//}

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    @State private var isTabBarHidden = false
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            if selectedTab == 0 {
                TravelScheduleView(isTabBarHidden: $isTabBarHidden)
                    .transition(.move(edge: .leading))
            } else {
                SettingView(isTabBarHidden: $isTabBarHidden)
                    .transition(.move(edge: .trailing))
            }
            
            if !isTabBarHidden {
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(.uGray)
                        .frame(height: 1)
                    HStack {
                        TabBarButton(
                            icon: "schedule",
                            title: "Расписание",
                            isSelected: selectedTab == 0
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTab = 0
                                isTabBarHidden = false
                            }
                        }
                        
                        TabBarButton(
                            icon: "settings",
                            title: "Настройки",
                            isSelected: selectedTab == 1
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTab = 1
                                isTabBarHidden = false
                            }
                        }
                    }
                    .frame(height: 60)
                    .padding(.vertical, 8)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(icon)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .ypBlack : .uGray)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .ypBlack : .uGray)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 26)
    }
}

#Preview {
    TabBarView()
}

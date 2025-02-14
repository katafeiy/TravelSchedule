
import SwiftUI

struct TabBarView: View {
    
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @State private var selectedTabIndex = 0
    @State private var isTabBarHidden = false
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            if selectedTabIndex == 0 {
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
                            icon: .schedule,
                            isSelected: selectedTabIndex == 0
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTabIndex = 0
                                isTabBarHidden = false
                            }
                        }
                        TabBarButton(
                            icon: .settings,
                            isSelected: selectedTabIndex == 1
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTabIndex = 1
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
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    TabBarView()
}

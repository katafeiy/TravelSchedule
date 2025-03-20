import SwiftUI

struct TabBarView: View {
    
    @StateObject var navModel = NavigationModel()
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        
        ZStack {
            if viewModel.selectedTabIndex == 0 {
                TravelScheduleView(isTabBarHidden: $viewModel.isTabBarHidden)
                    .transition(.move(edge: .leading))
            } else {
                SettingView(isTabBarHidden: $viewModel.isTabBarHidden)
                    .transition(.move(edge: .trailing))
            }
            VStack {
                Spacer()
                tabBar
                    .offset(y: viewModel.isTabBarHidden ? 100 : 0)
                    .animation(.easeInOut(duration: 0.5), value: viewModel.isTabBarHidden)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(viewModel.isDarkMode ? .dark : .light)
        .environmentObject(navModel)
    }
    
    private var tabBar: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(.uGray)
                .frame(height: 1)
            HStack {
                TabBarButton(
                    icon: .schedule,
                    isSelected: viewModel.selectedTabIndex == 0
                ) {
                    withAnimation(.easeInOut) {
                        viewModel.selectedTabIndex = 0
                        viewModel.isTabBarHidden = false
                    }
                }
                TabBarButton(
                    icon: .settings,
                    isSelected: viewModel.selectedTabIndex == 1
                ) {
                    withAnimation(.easeInOut) {
                        viewModel.selectedTabIndex = 1
                        viewModel.isTabBarHidden = false
                    }
                }
            }
            .frame(height: 60)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    TabBarView()
}


import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        
            VStack {
                Toggle("Темная тема", isOn: $isDarkMode)
                    .padding(16)
                Button {
                    navModel.push(.userAgreement)
                    isTabBarHidden = true
                } label: {
                    HStack {
                        Text("Пользовательское соглашение")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(16)
                    .foregroundColor(isDarkMode ? .white : .black)
                }
                Spacer()
                VStack {
                    Text("Приложение использует API \u{00AB}Яндекс.Расписания\u{00BB}")
                        .padding(.bottom, 16)
                    Text("Версия 1.0 (Beta)")
                }
                .padding(.bottom, 100)
                .font(.system(size: 12, weight: .light))
            }
            .onAppear() {
                isTabBarHidden = false
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    NavigationStack {
        SettingView(isTabBarHidden: .constant(false))
            .environmentObject(NavigationModel())
    }
}

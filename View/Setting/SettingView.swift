import SwiftUI

struct SettingView: View {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    @Binding var isTabBarHidden: Bool
    @State private var isUserAgreementActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Темная тема", isOn: $isDarkMode)
                    .padding(16)
                Button {
                    isUserAgreementActive = true
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
                .navigationDestination(isPresented: $isUserAgreementActive){
                    UserAgreementView(isTabBarHidden: $isTabBarHidden)
                }
                Spacer()
                VStack {
                    Text("Приложение использует API \u{00AB}Яндекс.Расписания\u{00BB}")
                        .padding(.bottom, 16)
                    Text("Версия 1.0 (Beta)")
                }
                .padding(.bottom, 58)
                .font(.system(size: 12, weight: .light))
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    SettingView(isTabBarHidden: .constant(false))
}

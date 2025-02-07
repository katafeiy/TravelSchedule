import SwiftUI

struct SettingView: View {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Темная тема", isOn: $isDarkMode)
                    .padding(16)
                NavigationLink(destination: UserAgreementView()) {
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
                .padding(.bottom, 24)
                .font(.system(size: 12, weight: .light))
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingView()
}

import SwiftUI
import WebKit

struct UserAgreementView: View {
    
    var body: some View {
        NavigationView {
            WebView(url: URL(string: YPUserAgreement.YPUAUrl.stringValue)!)
                        .navigationTitle("Пользовательское соглашение")
                        .navigationBarTitleDisplayMode(.inline)
                }
    }
}

#Preview {
    UserAgreementView()
}

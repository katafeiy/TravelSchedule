import SwiftUI
import WebKit

struct UserAgreementView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        
        HStack {
            Button(action: {
                dismiss()
                isTabBarHidden = false
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 20, weight: .regular))
            }
            Spacer()
            Text("Пользовательское соглашение")
                .font(.headline)
                .padding(.bottom, 5)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 10)
        
        NavigationView {
            WebView(url: URL(string: YPUserAgreement.YPUAUrl.stringValue)!)
        }
    }
}

#Preview {
    UserAgreementView(isTabBarHidden: .constant(true))
}

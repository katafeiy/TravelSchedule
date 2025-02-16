import SwiftUI
import WebKit

struct UserAgreementView: View {
    
    @EnvironmentObject var navModel: NavigationModel
//    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navModel.pop(.setting(.void))
                    //                dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
                Text("Пользовательское соглашение")
                    .font(.headline)

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 10)
            
            NavigationView {
                WebView(url: URL(string: YPUserAgreement.YPUAUrl.stringValue)!)
            }
        }
    }
}

#Preview {
    NavigationStack {
        UserAgreementView()
            .environmentObject(NavigationModel())
    }
}

import SwiftUI

struct ServerError: View {
    
    var body: some View {
        VStack {
            Image("serverError")
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            Text("Ошибка сервера")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
        }
    }
}

#Preview {
    ServerError()
}

import SwiftUI

struct NoInternet: View {
    
    var body: some View {
        VStack {
            Image("noInternet")
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            Text("Нет интернета")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
        }
    }
}

#Preview {
    NoInternet()
}

import SwiftUI

struct ErrorsView: View {
    private var errors: Errors
    
    init(errors: Errors) {
        self.errors = errors
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(errors.type.image)
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            Text(errors.type.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            Spacer()
        }
    }
}

#Preview {
    ErrorsView(errors: Errors.noInternet)
}

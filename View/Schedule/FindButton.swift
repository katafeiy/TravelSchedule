import SwiftUI

struct FindButton: View {
    
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Найти")
                .foregroundColor(.uWhite)
                .font(.system(size: 17, weight: .bold))
                .frame(width: 150, height: 60)
                .background(isEnabled ? .uBlue : .uGray)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1 : 0)
    }
}

#Preview {
    FindButton(isEnabled: true) { }
}

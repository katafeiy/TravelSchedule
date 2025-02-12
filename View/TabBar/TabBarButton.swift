import SwiftUI

struct TabBarButton: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(icon)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .ypBlack : .uGray)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 26)
    }
}

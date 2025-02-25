import SwiftUI

struct SwapButton: View {
    
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(.change)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .frame(width: 36, height: 36)
        .foregroundColor(.uBlue)
        .background(.uWhite)
        .clipShape(Circle())
    }
}


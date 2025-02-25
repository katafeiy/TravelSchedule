import SwiftUI

struct CloseButton: View {
    
    let icon: ImageResource
    let action: () -> Void
    
    var body: some View {
    
        Button {
            action()
        } label: {
            Image(icon)
        }
        .frame(width: 30, height: 30)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


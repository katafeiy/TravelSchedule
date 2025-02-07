import SwiftUI

struct PreviewCellView: View {
    
    let imageName: String
    let imageHeight: Double = 140
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)

        }
        .padding()
        .frame(maxWidth: 92, maxHeight: 140)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PreviewCellView(imageName: "preview1")
}

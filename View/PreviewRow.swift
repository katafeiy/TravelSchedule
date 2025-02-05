import SwiftUI

struct PreviewRow: View {
    
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
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}

#Preview {
    PreviewRow(imageName: "preview1")
}

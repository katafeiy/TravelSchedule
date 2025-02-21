import SwiftUI

struct PreviewCellView: View {
    
    let storyPreview: ImageResource
    let imageHeight: Double = 140
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Image(storyPreview)
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)
            
            Text("Text, Text, Text")
                .foregroundStyle(.uWhite)
                .font(.caption)
                .padding(.bottom, 7)
            
        }
        .frame(maxWidth: 92, maxHeight: 140)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(style: StrokeStyle(lineWidth: 5)).fill(Color.uBlue))
    }
}

#Preview {
    PreviewCellView(storyPreview: .preview1)
}

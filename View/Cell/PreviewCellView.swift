import SwiftUI

struct PreviewCellView: View {
    
    let titlePreView: String
    let storyPreview: ImageResource
    let isViewed: Bool
    let imageHeight: Double = 140
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            Image(storyPreview)
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)
            
            Text(titlePreView)
                .foregroundStyle(.uWhite)
                .font(.caption)
                .lineLimit(3)
                .padding(.init(top: 0, leading: 8, bottom: 12, trailing: 8))
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: 92, maxHeight: 140)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .opacity(isViewed ? 0.5 : 1)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(style: StrokeStyle(lineWidth: 5)).fill(isViewed ? Color.clear : Color.uBlue))
    }
}

#Preview {
    PreviewCellView(titlePreView: "Яндекс.Практикум это лучшая онлайн-школа", storyPreview: .preview1, isViewed: false)
}

#Preview {
    PreviewCellView(titlePreView: "Яндекс.Практикум это лучшая онлайн-школа", storyPreview: .preview1, isViewed: true)
}

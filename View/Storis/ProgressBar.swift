import SwiftUI

extension CGFloat {
    
    static let progressBarCornerRadius: CGFloat = 6
    static let progressBarHeight: CGFloat = 6
    
}

struct ProgressBar: View {
    
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: geometry.size.width, height: .progressBarHeight)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: min(
                        progress * geometry.size.width,
                        geometry.size.width
                    ),
                           height: .progressBarHeight
                    )
                    .foregroundStyle(.uBlue)
            }
            .mask {
                MaskView(countOfSections: numberOfSections)
            }
        }
    }
}

#Preview {
    ProgressBar(numberOfSections: 2, progress: 0.75)
        .padding()
}

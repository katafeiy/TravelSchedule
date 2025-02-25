import SwiftUI

struct MaskView: View {
    
    let countOfSections: Int
    
    var body: some View {
        
        HStack {
            ForEach(0..<countOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

#Preview {
    Color.red
        .ignoresSafeArea(edges: .all)
        .overlay(
            MaskView(countOfSections: 2)
                .padding()
     )
}

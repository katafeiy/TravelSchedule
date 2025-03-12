import SwiftUI

struct TrainLoadingView: View {
    @State private var offset: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text("🚂")
                    .font(.system(size: 40))
                ForEach(0..<3, id: \.self) { _ in
                    Text("🚃")
                        .font(.system(size: 40))
                }
            }
            .offset(x: offset)
            .animation(
                .linear(duration: 3)
                .repeatForever(autoreverses: false),
                value: offset
            )
            .onAppear {
                offset = -UIScreen.main.bounds.width
            }
            Text("Подгружаем данные...")
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 16)
        }
    }
}


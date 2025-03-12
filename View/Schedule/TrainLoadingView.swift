import SwiftUI

struct TrainLoadingView: View {
    
    @State private var offset: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Text("🚂")
                    .font(.system(size: 40))
                ForEach(0..<5, id: \.self) { _ in
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
            Text("Загружаем данные...")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 5)
        }
    }
}

#Preview {
    TrainLoadingView()
}

import SwiftUI

struct CompassLoadingView: View {
    @State private var rotation: Double = 0

    var body: some View {
        VStack {
            Image(systemName: "safari") // Используем иконку в виде компаса
                .resizable()
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotation))
                .animation(
                    .linear(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: rotation
                )
                .onAppear {
                    rotation = 360 // Постоянное вращение
                }

            Text("Ищем маршруты...")
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 8)
        }
        .foregroundColor(.uBlack)
        .padding(.bottom, 350)
    }
}


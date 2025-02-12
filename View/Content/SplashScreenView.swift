import SwiftUI

struct SplashScreenView: View {
    
    @State var isSplashScreenActive: Bool = false
    
    var body: some View {
        if isSplashScreenActive {
            TabBarView()
        } else {
            Image("splashScreen")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            self.isSplashScreenActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    SplashScreenView()
}

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            
            Text("Loading data...")
                .foregroundColor(.red)
                .foregroundStyle(.primary)
                .padding(.bottom)
            
            Button(action: {
                Task {
                    await viewModel.mainRequest()
                }
            }) {
                Text("Request")
            }
        }
        .onAppear() {
            
        }
        .padding()
    }
}
#Preview {
    ContentView()
}

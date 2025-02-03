import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    @State private var viewModel = TravelScheduleViewModel()
    
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
            
            Button("Request", action: {
                Task {
                    await viewModel.mainRequest()
                }
            })
            .buttonStyle(.borderedProminent)
            ProgressView(value: viewModel.progress)
        }
        .onAppear() {
            
        }
        .padding()
    }
}

#Preview {
    TravelScheduleView()
}

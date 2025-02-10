import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var viewModel = TravelScheduleViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        
        let rows = [GridItem(.flexible())]
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(ModelData().images) { imageItem in
                            PreviewCellView(imageName: imageItem.name)
                        }
                    }
                }
                FromToInView(path: $path)
            }
            .padding(.horizontal, 16)
            Spacer(minLength: 273)
        }
        .onAppear() {
            
        }
    }
}

#Preview {
    TravelScheduleView()
}

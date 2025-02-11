import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @Binding var isTabBarHidden: Bool
    @StateObject var navModel = NavigationModel()
    @StateObject private var viewModel = TravelScheduleViewModel()
    
    var body: some View {
        
        let rows = [GridItem(.flexible())]
        
        NavigationStack(path: $navModel.path) {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(ModelData().images) { imageItem in
                            PreviewCellView(imageName: imageItem.name)
                        }
                    }
                }
                FromToInView(isTabBarHidden: $isTabBarHidden)
            }
            .padding(.horizontal, 16)
            Spacer(minLength: 273)
        }
        .environmentObject(navModel)
        .onAppear() {
        }
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(true))
}

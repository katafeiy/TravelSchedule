import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {

    @StateObject private var viewModel = TravelScheduleViewModel()
    @StateObject var navModel = NavigationModel()
    @Binding var isTabBarHidden: Bool
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        
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
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(false))
}

import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var viewModel = TravelScheduleViewModel()
    
    var body: some View {
        
        let rows = [GridItem(.flexible())]
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(ModelData().images) { imageItem in
                            PreviewCellView(imageName: imageItem.name)
                        }
                    }
                }
                FromToInView()
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

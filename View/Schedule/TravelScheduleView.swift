import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var viewModel = TravelScheduleViewModel()
    @StateObject var navModel = NavigationModel()
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    
    @Binding var isTabBarHidden: Bool
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                    
                    ForEach(ModelData().images) { imageItem in
                        PreviewCellView(imageName: imageItem.name)
                    }
                    
                }
                
            }
            .padding(.vertical, 24)
            .padding(.leading, 16)
            
            FromToInView(isTabBarHidden: $isTabBarHidden, fromCity: $fromCity, toCity: $toCity)
                .padding(.horizontal, 16)
        }
        
        .onAppear() {
            isTabBarHidden = false
        }
        .navigationDestination(for: Screen.self) { screen in
            Route.destination(screen, from: $fromCity, toIn: $toCity)
        }
        
    }
}

#Preview {
    NavigationStack {
        TravelScheduleView(isTabBarHidden: .constant(false))
            .environmentObject(NavigationModel())
    }
}









//import SwiftUI
//import OpenAPIURLSession
//
//struct TravelScheduleView: View {
//    
//    @StateObject private var viewModel = TravelScheduleViewModel()
//    @StateObject var navModel = NavigationModel()
//    @Binding var isTabBarHidden: Bool
//    
//    let rows = [GridItem(.flexible())]
//    
//    var body: some View {
//        
//        VStack {
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                
//                LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
//                    
//                    ForEach(ModelData().images) { imageItem in
//                        PreviewCellView(imageName: imageItem.name)
//                    }
//                    
//                }
//            }
//            .padding(.top, 24)
//            .padding(.leading, 16)
//            
//            FromToInView(isTabBarHidden: $isTabBarHidden)
//                .padding(.top, 20)
//                .padding(.horizontal, 16)
//        }
//        Spacer()
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        Spacer()
//    }
//}
//
//#Preview {
//    TravelScheduleView(isTabBarHidden: .constant(false))
//}

import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var viewModel = TravelScheduleViewModel()
    @EnvironmentObject var navModel: NavigationModel
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    
    @Binding var isTabBarHidden: Bool
    
    let rows = [GridItem(.fixed(140))]
    
    var body: some View {
        
        NavigationStack(path: $navModel.pathSchedule) {
            
            VStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(rows: rows, alignment: .top, spacing: 20) {
                        
                        ForEach(ModelData().images) { imageItem in
                            PreviewCellView(imageName: imageItem.name)
                        }
                        
                    }
                    .padding(.vertical, 24)
                    .frame(height: 188)
                }
                .padding(.leading, 16)
                
                FromToInView(isTabBarHidden: $isTabBarHidden, fromCity: $fromCity, toCity: $toCity)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .onAppear() {
                isTabBarHidden = false
            }
            .navigationDestination(for: Screen.Schedule.self) { screen in
                Route.scheduleFlowDestination(screen, from: $fromCity, toIn: $toCity)
            }
        }
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(false))
        .environmentObject(NavigationModel())
}







import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject private var viewModel = TravelScheduleViewModel(
        fromStation: Station(
            direction: "",
            codes: StationCodes(yandexCode: "", esrCode: ""),
            stationType: "",
            title: "",
            longitude: 0.0,
            transportType: "",
            latitude: 0.0
        ),
        toStation: Station(
            direction: "",
            codes: StationCodes(yandexCode: "", esrCode: ""),
            stationType: "",
            title: "",
            longitude: 0.0,
            transportType: "",
            latitude: 0.0
        )
    )
    
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        
        NavigationStack(path: $navModel.pathSchedule) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.fixed(140))], alignment: .top, spacing: 20) {
                        ForEach(viewModel.stories) { story in
                            Button {
                                viewModel.selectStory(story)
                                isTabBarHidden = true
                            } label: {
                                PreviewCellView(titlePreView: story.title, storyPreview: story.small, isViewed: story.isViewed)
                            }
                        }
                    }
                    .padding(.vertical, 24)
                    .frame(height: 188)
                }
                .padding(.leading, 16)
                
                FromToInView(isTabBarHidden: $isTabBarHidden,
                             fromStation: $viewModel.fromStation,
                             toStation: $viewModel.toStation)
                .padding(.top, 20)
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .onAppear() {
                isTabBarHidden = false
            }
            .navigationDestination(for: Screen.Schedule.self) { screen in
                Route.scheduleFlowDestination(screen, from: $viewModel.fromStation, toIn: $viewModel.toStation)
            }
            .fullScreenCover(isPresented: $viewModel.isStoriesShown, onDismiss: { isTabBarHidden = false }) {
                ContentStoryView(
                    stories: viewModel.stories,
                    indexStory: viewModel.selectedItem,
                    isPresented: $viewModel.isStoriesShown,
                    isViewed: viewModel.isStoryViewed
                )
            }
        }
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(false))
        .environmentObject(NavigationModel())
}







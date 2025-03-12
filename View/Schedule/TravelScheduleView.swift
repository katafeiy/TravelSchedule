import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject private var viewModel = TravelScheduleViewModel(
        fromSettlement: PreviewMockData.shared.settlementMoscowEmpty[0],
        toSettlement: PreviewMockData.shared.settlementSanPetersburgEmpty[0],
        fromStation: PreviewMockData.shared.stationsMoscowEmpty[0],
        toStation: PreviewMockData.shared.stationsSanPetersburgEmpty[0]
    )
    
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        ZStack {
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
                                 fromSettlement: $viewModel.fromSettlement,
                                 toSettlement: $viewModel.toSettlement,
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
                    Route.scheduleFlowDestination(screen, fromSettlement: $viewModel.fromSettlement, from: $viewModel.fromStation, toSettlement: $viewModel.toSettlement, toIn: $viewModel.toStation)
                }
                .fullScreenCover(isPresented: $viewModel.isStoriesShown, onDismiss: { isTabBarHidden = false }) {
                    ContentStoryView(
                        stories: viewModel.stories,
                        indexStory: viewModel.selectedItem,
                        isPresented: $viewModel.isStoriesShown,
                        isViewed: viewModel.isStoryViewed
                    )
                }
                .onAppear()  {
                    Task {
                        do {
                            try await viewModel.getCity()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            if viewModel.isLoading {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    TrainLoadingView()
                }
            }
        }
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(false))
        .environmentObject(NavigationModel())
}







import SwiftUI
import OpenAPIURLSession

struct TravelScheduleView: View {
    
    @StateObject private var modelData = ModelData.shared
    @StateObject private var viewModel = TravelScheduleViewModel()
    @EnvironmentObject var navModel: NavigationModel
    @State private var isStoriesShown: Bool = false
    
    private var isStoryViewed: Binding<Bool> {
        Binding<Bool> (
            get: {
                let storyIndex = modelData.stories.firstIndex(where: { selectedStory == $0 })
                return modelData.stories[storyIndex ?? 0].isViewed
            },
            set: {
                let storyIndex = ModelData.shared.stories.firstIndex(where: { selectedStory == $0 })
                modelData.stories[storyIndex ?? 0].isViewed = $0
            }
        )
    }
    
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    @Binding var isTabBarHidden: Bool
    
    let rows = [GridItem(.fixed(140))]
    
    @State private var selectedItem: [ContentStory] = []
    @State private var selectedStory: Story = Story(small: .preview1, title: "", isViewed: false, story: [])
    
    var body: some View {
        
        NavigationStack(path: $navModel.pathSchedule) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 20) {
                        ForEach(modelData.stories) { imageItem in
                            Button {
                                self.selectedStory = imageItem
                                self.selectedItem = imageItem.story
                                isStoriesShown = true
                                isTabBarHidden = true
                            } label: {
                                PreviewCellView(titlePreView: imageItem.title, storyPreview: imageItem.small, isViewed: imageItem.isViewed)
                            }
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
            .fullScreenCover(isPresented: $isStoriesShown) {
                ContentStoryView(stories: selectedItem, isPresented: $isStoriesShown, isViewed: isStoryViewed)
            }
        }
    }
}

#Preview {
    TravelScheduleView(isTabBarHidden: .constant(false))
        .environmentObject(NavigationModel())
}







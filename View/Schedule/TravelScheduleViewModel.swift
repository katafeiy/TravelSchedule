import SwiftUI

@MainActor
final class TravelScheduleViewModel: ObservableObject {
    
    @Published var stories: [Story] = ModelData.shared.stories
    @Published var selectedStory: Story = Story(small: .preview1, title: "", isViewed: false, story: [])
    @Published var selectedItem: Int = 0
    @Published var isStoriesShown: Bool = false
    
    @Published var fromCity: String = ""
    @Published var toCity: String = ""
    
    var isStoryViewed: Binding<Bool> {
        Binding<Bool> (
            get: { [self] in
                let storyIndex = stories.firstIndex(where: { selectedStory == $0 })
                return stories[storyIndex ?? 0].isViewed
            },
            set: { [self] in
                let storyIndex = stories.firstIndex(where: { selectedStory == $0 })
                stories[storyIndex ?? 0].isViewed = $0
            }
        )
    }
    
    func selectStory(_ story: Story) {
        if let index = stories.firstIndex(of: story) {
            selectedStory = story
            selectedItem = index
            isStoriesShown = true
        }
    }
    
    
    
    
    
}

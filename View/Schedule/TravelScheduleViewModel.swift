import SwiftUI

@MainActor
final class TravelScheduleViewModel: ObservableObject {
    
    @Published var stories: [Story]
    @Published var selectedStory: Story
    @Published var selectedItem: Int
    @Published var isStoriesShown: Bool
    
    @Published var fromStation: Station
    @Published var toStation: Station
    
    init(
        stories: [Story] = StoriesStabData.shared.stories,
        selectedStory: Story = Story(small: .preview1, title: "", isViewed: false, story: []),
        selectedItem: Int = 0,
        isStoriesShown: Bool = false,
        fromStation: Station,
        toStation: Station
    ) {
        self.stories = stories
        self.selectedStory = selectedStory
        self.selectedItem = selectedItem
        self.isStoriesShown = isStoriesShown
        self.fromStation = fromStation
        self.toStation = toStation
    }
    
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

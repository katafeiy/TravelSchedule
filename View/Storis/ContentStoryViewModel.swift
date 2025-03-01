import SwiftUI
import Combine

class ContentStoryViewModel: ObservableObject {
    
    @Published var indexStory: Int
    @Published var progress: CGFloat = 0
    @Binding var isPresented: Bool
    @Binding var isViewed: Bool
    
    private let stories: [Story]
    private let configuration: ConfigProgressBar
    private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    private var cancellable: Cancellable?
    
    var currentContentStory: ContentStory { stories[indexStory].story[indexCurrentStory] }
    var countSectionContentStory: Int { stories[indexStory].story.count }
    
    private var indexCurrentStory: Int { Int(progress * CGFloat(stories[indexStory].story.count)) }
    
    init(stories: [Story], indexStory: Int, isPresented: Binding<Bool>, isViewed: Binding<Bool>) {
        self.stories = stories
        self.indexStory = indexStory
        self._isPresented = isPresented
        self._isViewed = isViewed
        self.configuration = ConfigProgressBar(storiesCount: stories[indexStory].story.count)
        self.timer = Self.createTimer(configuration: configuration)
    }
    
    func timerTick() {
        print("Timer tick")
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            closeStory()
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
    }
    
    func timerSend() -> Timer.TimerPublisher {
        timer
    }
    
    func nextStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        let nextContentStoryIndex = currentStoryIndex + 1 < storiesContentCount ? currentStoryIndex + 1 : 0
        if currentStoryIndex + 1 == storiesContentCount {
            indexStory = indexStory + 1 >= storiesCount ? 0 : indexStory + 1
            progress = 0
        } else {
            withAnimation {
                progress = CGFloat(nextContentStoryIndex) / CGFloat(storiesContentCount)
            }
        }
    }
    
    func previousStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        let previousStoryIndex = currentStoryIndex - 1 >= 0 ? currentStoryIndex - 1 : storiesContentCount - 1
        if indexStory == 0 && currentStoryIndex == 0 {
            return
        } else if currentStoryIndex == 0 {
            indexStory = indexStory - 1 < storiesCount ? indexStory - 1 : 0
        }
        withAnimation {
            progress = CGFloat(previousStoryIndex) / CGFloat(storiesContentCount)
        }
    }
    
    func closeStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        if indexStory + 1 != storiesCount {
            indexStory = indexStory + 1 >= storiesCount ? 0 : indexStory + 1
            progress = 0
        } else if currentStoryIndex == storiesContentCount - 1 {
            isPresented = false
            isViewed = true
        }
    }
    
    func startTimer() {
        print("Start timer")
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    func stopTimer() {
        cancellable?.cancel()
    }
    
    func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    private static func createTimer(configuration: ConfigProgressBar) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
    
}

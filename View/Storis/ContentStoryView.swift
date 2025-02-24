import SwiftUI
import Combine

struct ContentStoryView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    
    let stories: [Story]
    
    private let configuration: ConfigProgressBar
    
    @State private var indexStory: Int
    
//    private var currentStory: Story { stories[indexStory] }
    
    private var currentContentStory: ContentStory { stories[indexStory].story[indexCurrentStory] }
    
    private var indexCurrentStory: Int { Int(progress * CGFloat(stories[indexStory].story.count)) }
    
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    @Binding var isPresented: Bool
    @Binding var isViewed: Bool
    
    init(stories: [Story], indexStory: Int, isPresented: Binding<Bool>, isViewed: Binding<Bool>) {
        self.stories = stories
        self.indexStory = indexStory
        self.configuration = ConfigProgressBar(storiesCount: stories[indexStory].story.count)
        self.timer = Self.createTimer(configuration: configuration)
        self._isPresented = isPresented
        self._isViewed =  isViewed
    }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            StorisView(story: currentContentStory)
            
            ProgressBar(numberOfSections: stories[indexStory].story.count, progress: progress)
                .padding(.init(top: 28, leading: 16, bottom: 0, trailing: 16))
            
            CloseButton(icon: .close, action: { isPresented = false; isViewed = true })
                .padding(.top, 57)
                .padding(.trailing, 12)
            
        }
        .background(Color.uBlack)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            timer = Self.createTimer(configuration: configuration)
            cancellable = timer.connect()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            timerTick()
        }
        .onTapGesture {apGesture in
            if apGesture.x < UIScreen.main.bounds.width / 2 {
                previousStory()
            } else {
                nextStory()
            }
            resetTimer()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -50 {
                        nextStory()
                        resetTimer()
                    } else if value.translation.width > 50 {
                        previousStory()
                        resetTimer()
                    } else if value.translation.height > 50 {
                        isPresented = false
                    }
                }
        )
        
    }
    
    private func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            closeStory()
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
    }

    private func nextStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        let nextContentStoryIndex = currentStoryIndex + 1 < storiesContentCount ? currentStoryIndex + 1 : 0
        if currentStoryIndex + 1 == storiesContentCount {
            indexStory = indexStory + 1 >= storiesCount ? 0 : indexStory + 1
        }
        withAnimation {
            progress = CGFloat(nextContentStoryIndex) / CGFloat(storiesContentCount)
        }
    }
    
    private func previousStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        var previousStoryIndex = currentStoryIndex - 1 >= 0 ? currentStoryIndex - 1 : storiesContentCount - 1
        if currentStoryIndex == 0 {
            indexStory = indexStory - 1 < storiesCount ? 0 : indexStory - 1
            previousStoryIndex = 0
        }
        withAnimation {
            progress = CGFloat(previousStoryIndex) / CGFloat(storiesContentCount)
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private func closeStory() {
        let storiesCount = stories.count
        let storiesContentCount = stories[indexStory].story.count
        let currentStoryIndex = Int(progress * CGFloat(storiesContentCount))
        if indexStory + 1 != storiesCount {
            indexStory = indexStory + 1 >= storiesCount ? 0 : indexStory + 1
        } else if currentStoryIndex == storiesContentCount - 1 {
            isPresented = false
            isViewed = true
        }
    }
    
    private static func createTimer(configuration: ConfigProgressBar) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    NavigationStack {
        ContentStoryView(stories: ModelData.shared.stories,
                         indexStory: 2,
                         isPresented: .constant(true),
                         isViewed: .constant(false))
            .environmentObject(NavigationModel())
    }
}


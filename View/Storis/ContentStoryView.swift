import SwiftUI
import Combine

struct ContentStoryView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    
    let contentStories: [ContentStory]
    private let configuration: ConfigProgressBar
    private var currentStory: ContentStory { contentStories[indexStory] }
    private var indexStory: Int { Int(progress * CGFloat(contentStories.count)) }
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    @Binding var isPresented: Bool
    @Binding var isViewed: Bool
    
    init(stories: [ContentStory], isPresented: Binding<Bool>, isViewed: Binding<Bool>) {
        self.contentStories = stories
        self.configuration = ConfigProgressBar(storiesCount: stories.count)
        self.timer = Self.createTimer(configuration: configuration)
        self._isPresented = isPresented
        self._isViewed =  isViewed
    }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            StorisView(story: currentStory)
            
            ProgressBar(numberOfSections: contentStories.count, progress: progress)
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
                        navModel.popRoot(.schedule(.toRoot))
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
        let storiesCount = contentStories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let nextStoryIndex = currentStoryIndex + 1 < storiesCount ? currentStoryIndex + 1 : 0
        withAnimation {
            progress = CGFloat(nextStoryIndex) / CGFloat(storiesCount)
        }
    }
    
    private func previousStory() {
        let storiesCount = contentStories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let previousStoryIndex = currentStoryIndex - 1 >= 0 ? currentStoryIndex - 1 : storiesCount - 1
        withAnimation {
            progress = CGFloat(previousStoryIndex) / CGFloat(storiesCount)
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private func closeStory() {
        let storiesCount = contentStories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        if currentStoryIndex == storiesCount - 1 {
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
        ContentStoryView(stories: ModelData.shared.stories.first!.story, isPresented: .constant(true), isViewed: .constant(false))
            .environmentObject(NavigationModel())
    }
}


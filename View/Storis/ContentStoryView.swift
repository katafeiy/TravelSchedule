import SwiftUI
import Combine

struct ContentStoryView: View {
   
    @EnvironmentObject var navModel: NavigationModel
    
    let stories: [ContentStory]
    private let configuration: ConfigProgressBar
    private var currentStory: ContentStory { stories[indexStory] }
    private var indexStory: Int { Int(progress * CGFloat(stories.count)) }
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    
    init(stories: [ContentStory]) {
        self.stories = stories
        self.configuration = ConfigProgressBar(storiesCount: stories.count)
        self.timer = Self.createTimer(configuration: configuration)
    }

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            StorisView(story: currentStory)
            
            ProgressBar(numberOfSections: stories.count, progress: progress)
                .padding(.init(top: 28, leading: 16, bottom: 0, trailing: 16))
            
            CloseButton(icon: .close, action: { navModel.popRoot(.schedule(.toRoot)) })
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
            nextStory()
            resetTimer()
        }
    }
    
    private func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
    }
    
    private func nextStory() {
        let storiesCount = stories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let nextStoryIndex = currentStoryIndex + 1 < storiesCount ? currentStoryIndex + 1 : 0
        withAnimation {
            progress = CGFloat(nextStoryIndex) / CGFloat(storiesCount)
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private static func createTimer(configuration: ConfigProgressBar) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    ContentStoryView(stories: ModelData().images.first!.story)
}

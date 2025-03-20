import SwiftUI
import Combine

struct ContentStoryView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @ObservedObject private var viewModel: ContentStoryViewModel
    
    init(stories: [Story], indexStory: Int, isPresented: Binding<Bool>, isViewed: Binding<Bool>) {
        _viewModel = ObservedObject(wrappedValue: ContentStoryViewModel(
            stories: stories,
            indexStory: indexStory,
            isPresented: isPresented,
            isViewed: isViewed))
    }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            StorisView(story: viewModel.currentContentStory)
            
            ProgressBar(numberOfSections: viewModel.countSectionContentStory, progress: viewModel.progress)
                .padding(.init(top: 28, leading: 16, bottom: 0, trailing: 16))
            
            CloseButton(icon: .close, action: { viewModel.isPresented = false; viewModel.isViewed = true })
                .padding(.top, 57)
                .padding(.trailing, 12)
            
        }
        .background(Color.uBlack)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("appear")
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
        .onReceive(viewModel.timerSend()) { _ in
            viewModel.timerTick()
        }
        .onTapGesture { tapGesture in
            if tapGesture.x < UIScreen.main.bounds.width / 2 {
                viewModel.previousStory()
            } else {
                viewModel.nextStory()
            }
            viewModel.resetTimer()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -50 {
                        viewModel.nextStory()
                        viewModel.resetTimer()
                    } else if value.translation.width > 50 {
                        viewModel.previousStory()
                        viewModel.resetTimer()
                    } else if value.translation.height > 50 {
                        viewModel.isPresented = false
                    }
                }
        )
    }
}

#Preview {
    NavigationStack {
        ContentStoryView(stories: StoriesStabData.shared.stories,
                         indexStory: 2,
                         isPresented: .constant(true),
                         isViewed: .constant(false))
            .environmentObject(NavigationModel())
    }
}


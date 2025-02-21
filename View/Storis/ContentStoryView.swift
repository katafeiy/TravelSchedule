import SwiftUI

struct ContentStoryView: View {
   
    @EnvironmentObject var navModel: NavigationModel
    
    let story: [ContentStory]
    private let indexStory: Int = 0
    private var currentStory: ContentStory { story[indexStory] }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            StorisView(story: currentStory)
            
            CloseButton(icon: .close, action: { navModel.popRoot(.schedule(.toRoot)) })
                .padding(.top, 57)
                .padding(.trailing, 12)
            
        }
        .background(Color.uBlack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentStoryView(story: ModelData().images.first!.story)
}

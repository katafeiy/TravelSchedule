import SwiftUI

struct StorisView: View {
    
    let story: ContentStory
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Image(story.big)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                Spacer()
                
                Text(story.title)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.uWhite)
                    .lineLimit(2)
                Text(story.description)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.uWhite)
                    .lineLimit(3)
            }
            .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    NavigationStack{
        StorisView(story: ContentStory(big: .big11,
                                title:
                            """
                            Text, Text, Text, Text, Text, Text, Text, Text,
                            Text, Text, Text, Text, Text, Text, Text, Text
                            """,
                                description:
                            """
                            Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text,
                            Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text,
                            """
                               ))
        .environmentObject(NavigationModel())
    }
}

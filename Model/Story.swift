import Foundation

struct Story: Identifiable, Hashable {
    let id = UUID()
    let small: ImageResource
    let story: [ContentStory]
}

struct ContentStory: Identifiable, Hashable {
    let id = UUID()
    let big: ImageResource
    let title: String
    let description: String
}

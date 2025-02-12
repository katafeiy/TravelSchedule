import SwiftUI

struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let stations: [Station]
}

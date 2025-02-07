
import SwiftUI

struct Carrier: Identifiable {
    let id = UUID()
    let carrierName: String
    let carrierLogo: Image
    let startTime: Date
    let endTime: Date
    let taimInRoute: Int
    let date: Date
}


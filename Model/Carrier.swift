import SwiftUI

struct Carrier: Identifiable {
    var id = UUID()
    var carrierName: String
    var carrierLogo: String
    var startTime: String
    var endTime: String
    var timeInRoute: Int
    var date: String
}


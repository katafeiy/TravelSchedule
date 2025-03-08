import SwiftUI

struct Carrier: Identifiable, Equatable, Hashable {
    var id = UUID()
    var isTransfer: Bool
    var carrierName: String
    var carrierLogo: String
    var startTime: String
    var endTime: String
    var timeInRoute: Int
    var date: String
    var email: String
    var phoneNumber: String
    var logo: String
}


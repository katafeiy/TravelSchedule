import Foundation

class CarrierInfoViewModel: ObservableObject {
    @Published var carrier: Carrier

    init(carrier: Carrier) {
        self.carrier = carrier
    }
}

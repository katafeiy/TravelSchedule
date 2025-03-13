import Foundation

@MainActor
final class CarrierListViewModel: ObservableObject {
    
    private var carriers: [Carrier] = []
    private var withTransition: Bool?
    @Published var visibleCarriers: [Carrier] = []
    @Published var isLoading: Bool = false
    
    
    @Published var carrierMock: [Carrier] = [
        Carrier(isTransfer: true, carrierName: "RZHD", carrierLogo: "", startTime: "21:30", endTime: "05:20", timeInRoute: 55, date: "16 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: ""),
        Carrier(isTransfer: false, carrierName: "RZHD", carrierLogo: "", startTime: "14:30", endTime: "21:20", timeInRoute: 55, date: "18 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: "")
        ]
    
    func fetchCarriers(from: String, to: String) async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            
        let data = try await TravelScheduleNetworkModel.shared.scheduleBetweenStation(from: from, to: to)
        
            data.segments?.forEach { segment in
                
                let newCarrier = Carrier(
                    isTransfer: segment.hasTransfers ?? false,
                    carrierName: segment.thread?.carrier?.title ?? "",
                    carrierLogo: segment.thread?.carrier?.logo ?? "",
                    startTime: DateFormatTime.formatTime(segment.departure ?? "", format: DateFormatTime.Format.HHmm),
                    endTime: DateFormatTime.formatTime(segment.arrival ?? "", format: DateFormatTime.Format.HHmm),
                    timeInRoute: (segment.duration ?? 0) / 3600,
                    date: DateFormatTime.formatTime(segment.startDate ?? "", format: DateFormatTime.Format.dMMMM),
                    email: segment.thread?.carrier?.email ?? "",
                    phoneNumber: segment.thread?.carrier?.phone ?? "",
                    logo: segment.thread?.carrier?.logo ?? ""
                )
                carriers.append(newCarrier)
            }
            updateVisibleCarriers()
        } catch {
            print("Ошибка загрузки: \(error.localizedDescription)") 
        }
    }
    
    func updateTransition(with transition: Bool) {
        withTransition = transition
        updateVisibleCarriers()
    }
    
    func updateVisibleCarriers() {
        visibleCarriers = carrierMock.filter {
            guard let withTransition else { return true }
            return withTransition ? $0.isTransfer : !$0.isTransfer
        }
        
    }
}

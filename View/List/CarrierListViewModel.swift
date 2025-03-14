import Foundation

@MainActor
final class CarrierListViewModel: ObservableObject {
    
    private var carriers: [Carrier] = CacheDataBase.shared.carriers
    @Published var visibleCarrier: [Carrier] = []
    @Published var isLoading: Bool = false
    
    //    var carrierMock2: [Carrier] = [
    //        Carrier(isTransfer: true, carrierName: "RZHD", carrierLogo: "", startTime: "21:30", endTime: "05:20", timeInRoute: 55, date: "16 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: ""),
    //        Carrier(isTransfer: false, carrierName: "RZHD", carrierLogo: "", startTime: "14:30", endTime: "21:20", timeInRoute: 55, date: "18 Марта", email: "cbdjsbcjbn@gmail.com", phoneNumber: "4545-4545-4545", logo: "")
    //        ]
    
    init() {
        visibleCarrier = carriers
    }
    
    func fetchCarriers(from: String, to: String, transfers: Bool) async throws {
        
        if carriers.isEmpty {
            
            guard !isLoading else { return }
            isLoading = true
            defer { isLoading = false }
            
            do {
                
                let data = try await TravelScheduleNetworkModel.shared.scheduleBetweenStation(from: from, to: to, transfers: transfers)
                
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
                    CacheDataBase.shared.carriers.append(newCarrier)
                    carriers = CacheDataBase.shared.carriers
                    visibleCarrier = carriers
                }
            } catch {
                print("Ошибка загрузки: \(error.localizedDescription)")
                self.carriers.removeAll()
            }
        } else {
            return
        }
    }
    
    func updateVisibleCarriers(withTransfer: Bool) {
        visibleCarrier = carriers.filter { carrier in
            return carrier.isTransfer == withTransfer
        }
        print("Результат фильтрации: \(visibleCarrier)")
    }
}

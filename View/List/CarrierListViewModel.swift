import Foundation

@MainActor
final class CarrierListViewModel: ObservableObject {
    
    private var carriers: [Carrier] = CacheDataBase.shared.carriers
    @Published var visibleCarrier: [Carrier] = []
    @Published var isLoading: Bool = false
    
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
                        email: (segment.thread?.carrier?.email?.isEmpty == false ? segment.thread?.carrier?.email : "Электронный адрес отсутствует") ?? "Электронный адрес отсутствует",
                        phoneNumber: (segment.thread?.carrier?.phone?.isEmpty == false ? segment.thread?.carrier?.phone : "Номер отсутствует") ?? "Номер отсутствует",
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
    
    func filterCarriers(
        selectedTimes: Set<String>,
        hasTransfers: Bool?,
        timeOptions: [String: (start: String, end: String)]
    ) {
        let selectedRanges = selectedTimes.compactMap { timeOptions[$0] }

        guard !selectedRanges.isEmpty else {
            visibleCarrier = carriers
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        visibleCarrier = carriers.filter { carrier in
            
            guard let startTime = dateFormatter.date(from: carrier.startTime) else { return false }
            guard let hasTransfers, hasTransfers == carrier.isTransfer else { return false }
            
            return selectedRanges.contains { range in
                if let rangeStart = dateFormatter.date(from: range.start),
                   let rangeEnd = dateFormatter.date(from: range.end) {
                    return startTime >= rangeStart && startTime <= rangeEnd
                }
                return false
            }
        }
    }
}

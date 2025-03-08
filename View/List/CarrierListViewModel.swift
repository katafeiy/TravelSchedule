import Foundation

@MainActor
final class CarrierListViewModel: ObservableObject {
    
    @Published var carriers: [Carrier] = []
    
    func fetchCarriers(from: String, to: String) async throws {
        
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
    }
}

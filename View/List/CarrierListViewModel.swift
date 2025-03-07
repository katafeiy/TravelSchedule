import Foundation
import Kingfisher

@MainActor
final class CarrierListViewModel: ObservableObject {
    
    @Published var carriers: [Carrier] = []
    
    func fetchCarriers(from: String, to: String) async throws {
        
        let data = try await TravelScheduleNetworkModel.shared.scheduleBetweenStation(from: from, to: to)
        
        data.segments?.forEach { segment in
            
            if let thread = segment.thread,
               let carrier = thread.carrier {
                
                let newCarrier = Carrier(
                    carrierName: carrier.title ?? "",
                    carrierLogo: carrier.logo ?? "",
                    startTime: DateFormatTime.formatDate(thread.interval?.begin_time ?? "", format: DateFormatTime.Format.HHmm) ,
                    endTime: DateFormatTime.formatDate(thread.interval?.end_time ?? "", format: DateFormatTime.Format.HHmm),
                    timeInRoute: Int((data.interval_segments?.first?.duration ?? 0.0) / 3600) ,
                    date: DateFormatTime.formatDate(thread.interval?.begin_time ?? "", format: DateFormatTime.Format.dMMMM)
                )
                carriers.append(newCarrier)
            }
        }
    }
    
    //    func avatarURL() -> URL? {
    //        guard
    //            let profileImageURL = ProfileImageService.shared.avatarURL,
    //            let url = URL(string: profileImageURL)
    //        else { return nil }
    //        return url
    //    }
    //
    //    private func updateAvatar() {
    //
    //        let processor = RoundCornerImageProcessor(cornerRadius: 36, backgroundColor: .clear)
    //        avatarAccountImage.kf.indicatorType = .activity
    //        avatarAccountImage.kf.setImage(with: presenter.avatarURL(),
    //                                       placeholder: UIImage(named: "placeholder.jpeg"),
    //                                       options: [.processor(processor), .cacheSerializer(FormatIndicatedCacheSerializer.png)])
    //    }
}

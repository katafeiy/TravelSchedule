import SwiftUI
import Kingfisher

struct CarrierCellView: View {
    
    let carrierInfo: Carrier
    let image: Image = Image(.RZHD)
    
    var body: some View {
        ZStack {
            VStack(spacing: 12)  {
                HStack {
                    KFImage(URL(string: carrierInfo.carrierLogo))
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(carrierInfo.carrierName)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.uBlack)
                        Text(carrierInfo.isTransfer ? "С пересадкой" : "Прямого следования")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.uRed)
                    }
                    Spacer()
                    Text(carrierInfo.date)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.uBlack)
                        .padding(.bottom, 27)
                }
                HStack {
                    Text(carrierInfo.startTime)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.uBlack)
                    Rectangle()
                        .fill(.uGray)
                        .frame(height: 1)
                    Text("\(carrierInfo.timeInRoute) часов")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.uBlack)
                    Rectangle()
                        .fill(.uGray)
                        .frame(height: 1)
                    Text(carrierInfo.endTime)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.uBlack)
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 104)
        .background(Color.uLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    CarrierCellView(
        carrierInfo: Carrier(
            isTransfer: true,
            carrierName: "РЖД",
            carrierLogo: "rzhd",
            startTime: "14:20",
            endTime: "22.45",
            timeInRoute: 20,
            date: "16 Марта",
            email: "info@rzhd.ru",
            phoneNumber: "8 (812) 912-12-12",
            logo: "RZHD"
        )
    )
}

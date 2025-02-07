import SwiftUI

struct CarrierList: View {
    
    var carrierInfo: Carrier
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 12)  {
                HStack(alignment: .center) {
                   carrierInfo.carrierLogo
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(carrierInfo.carrierName)
                            .font(.system(size: 17, weight: .regular))
                        Text("С пересадкой в Костроме")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.uRed)
                    }
                    Spacer()
                    Text(DateFormatTime.formatDate(carrierInfo.date, format: DateFormatTime.Format.dMMMM.rawValue))
                        .font(.system(size: 12, weight: .regular))
                        .padding(.bottom, 27)
                }
                HStack(alignment: .center) {
                    Text(DateFormatTime.formatDate(carrierInfo.startTime, format: DateFormatTime.Format.HHmm.rawValue))
                        .font(.system(size: 17, weight: .regular))
                    Rectangle()
                        .fill(.uGray)
                        .frame(height: 1)
                    Text("\(carrierInfo.taimInRoute) часов")
                        .font(.system(size: 12, weight: .regular))
                    Rectangle()
                        .fill(.uGray)
                        .frame(height: 1)
                    Text(DateFormatTime.formatDate(carrierInfo.endTime, format: DateFormatTime.Format.HHmm.rawValue))
                        .font(.system(size: 17, weight: .regular))
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .frame(width: 343, height: 104)
        .background(Color.uLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    CarrierList(carrierInfo: Carrier(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), taimInRoute: 20, date: Date()))
}

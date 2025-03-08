import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    let carrier: Carrier
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Button(action: {
                    navModel.pop(.schedule(.void))
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
                Text("Информация о перевозчике")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            
            KFImage(URL(string: carrier.logo))
                .resizable()
                .scaledToFit()
                .frame(height: 104)
                .padding(.horizontal, 16)
            
            Text("\u{00AB}\(carrier.carrierName)\u{00BB}")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            VStack(alignment: .leading) {
                Text("E-mail:")
                    .foregroundColor(.ypBlack)
                Text(carrier.email)
                    .foregroundColor(.uBlue)
            }
            VStack(alignment: .leading) {
                Text("Телефон:")
                    .foregroundColor(.ypBlack)
                Text(carrier.phoneNumber)
                    .foregroundColor(.uBlue)
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    NavigationStack {
        CarrierInfoView(
            carrier: Carrier(
                isTransfer: false,
                carrierName: "ОАО \u{00AB}РЖД\u{00BB}",
                carrierLogo: "",
                startTime: "",
                endTime: "",
                timeInRoute: 0,
                date: "",
                email: "info@rzhd.ru",
                phoneNumber: "+7 (495) 123-45-67",
                logo: ""
            )
        )
            .environmentObject(NavigationModel())
    }
}

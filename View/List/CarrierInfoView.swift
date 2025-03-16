import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject private var viewModel: CarrierInfoViewModel
    
    init(carrier: Carrier) {
        _viewModel = StateObject(wrappedValue: CarrierInfoViewModel(carrier: carrier))
    }
    
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
            
            KFImage(URL(string: viewModel.carrier.logo))
                .placeholder {
                   Text("Логотип перевозчика отсутствует")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(.uRed)
                }
                .resizable()
                .scaledToFit()
                .frame(height: 104)
                .padding(.horizontal, 16)
            
            Text("\u{00AB}\(viewModel.carrier.carrierName)\u{00BB}")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            VStack(alignment: .leading) {
                Text("E-mail:")
                    .foregroundColor(.ypBlack)
                Text(viewModel.carrier.email)
                    .foregroundColor(.uBlue)
            }
            VStack(alignment: .leading) {
                Text("Телефон:")
                    .foregroundColor(.ypBlack)
                Text(viewModel.carrier.phoneNumber)
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
        CarrierInfoView(carrier: PreviewMockData.shared.carrier)
            .environmentObject(NavigationModel())
    }
}

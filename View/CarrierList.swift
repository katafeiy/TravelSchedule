import SwiftUI

struct CarrierList: View {
    
    let from: String
    let to: String
    
    var body: some View {
    
        VStack(alignment: .leading) {
            Text("\(from) -> \(to)")
                .font(.system(size: 24, weight: .bold))
                .lineLimit(nil)
            
            ForEach(ModelData().carriers) { carrier in
                CarrierCellView(carrierInfo: carrier)
            }
        }
        .padding(.horizontal, 16)
        Spacer()
    }
}

#Preview {
    CarrierList(from: "Санкт-Петербург", to: "Санкт-Петербург")
}

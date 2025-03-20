import SwiftUI

struct CitySelectionButton: View {
    let title: String
    let settlementName: String
    let stationName: String
    let isIndentation: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(stationName.isEmpty ? title : "\(settlementName) (\(stationName))")
                .foregroundColor(stationName.isEmpty ? .uGray : .uBlack)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, isIndentation ? 20 : 0)
                .padding(.bottom, isIndentation ? 0 : 20)
                .padding(.leading, 20)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
        }
    }
}

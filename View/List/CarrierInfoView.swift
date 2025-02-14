import SwiftUI

struct CarrierInfoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Button(action: {
                    dismiss()
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
            
            Image("RZHD")
                .padding()
            
            Text("ОАО \u{00AB}РЖД\u{00BB}")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            VStack(alignment: .leading) {
                Text("E-mail:")
                    .foregroundColor(.ypBlack)
                Text("info@rzhd.ru")
                    .foregroundColor(.uBlue)
            }
            VStack(alignment: .leading) {
                Text("Телефон:")
                    .foregroundColor(.ypBlack)
                Text("+7 (495) 123-45-67")
                    .foregroundColor(.uBlue)
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    CarrierInfoView()
}

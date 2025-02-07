import SwiftUI

struct CarierInfoView: View {
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            Image("RZHD")
                .padding()
            
            Text("ОАО \u{00AB}РЖД\u{00BB}")
                .font(.system(size: 24, weight: .bold))
            VStack(alignment: .leading) {
                Text("E-mail")
                Text("info@rzhd.ru")
            }
            VStack(alignment: .leading) {
                Text("Телефон")
                Text("+7 (495) 123-45-67")
            }
        }
        Spacer()
    }
}

#Preview {
    CarierInfoView()
}

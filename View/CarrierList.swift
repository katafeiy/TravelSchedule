import SwiftUI

struct CarrierList: View {
    
    @State var goToFilterList: Bool = false
    
    let from: String
    let to: String
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text("\(from) -> \(to)")
                    .font(.system(size: 24, weight: .bold))
                    .lineLimit(nil)
                
                ZStack(alignment: .bottom) {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(ModelData().carriers) { carrier in
                                NavigationLink(destination: CarrierInfoView()) {
                                    CarrierCellView(carrierInfo: carrier)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.bottom, 100)
                    }
                    
                    Button{
                        self.goToFilterList = true
                    } label: {
                        Text("Уточнить время")
                            .foregroundColor(.uWhite)
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 343, height: 60)
                            .background(.uBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .navigationDestination(isPresented: $goToFilterList){
                        FilterView()
                    }
                    .padding(.bottom, 24)
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
}

#Preview {
    CarrierList(from: "Санкт-Петербург(Финляндский вокзал)", to: "Новосибирск(Новосибирск-Пассажирский)")
}

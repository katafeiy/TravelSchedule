import SwiftUI

struct CarrierList: View {
    
    @Binding var isTabBarHidden: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var goToFilterList: Bool = false
    
    let from: String
    let to: String
    
    var body: some View {
        
            VStack() {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.ypBlack)
                            .font(.system(size: 20, weight: .regular))
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
                
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
                        isTabBarHidden = true
                    } label: {
                        Text("Уточнить время")
                            .foregroundColor(.uWhite)
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 343, height: 60)
                            .background(.uBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .navigationDestination(isPresented: $goToFilterList){
                        FilterView(isTabBarHidden: $isTabBarHidden)
                    }
                    .padding(.bottom, 24)
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 16)
        
    }
}

#Preview {
    CarrierList(isTabBarHidden: .constant(true), from: "Санкт-Петербург(Финляндский вокзал)", to: "Новосибирск(Новосибирск-Пассажирский)")
}

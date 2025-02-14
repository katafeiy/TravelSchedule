import SwiftUI

struct CarrierList: View {
    
    @EnvironmentObject var navModel: NavigationModel
    
    let from: String
    let to: String
    
    var body: some View {
        
        VStack(spacing: 10){
            HStack {
                Button(action: {
                    navModel.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
            }
            .padding(.vertical, 10)
            
            Text(from + " -> " + to)
                .font(.system(size: 24, weight: .bold))
                .lineLimit(nil)
            
            ZStack(alignment: .bottom) {
                List(ModelData().carriers) { carrier in
                    Button  {
                        navModel.push(.carrierInfo)
                    } label: {
                        CarrierCellView(carrierInfo: carrier)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .padding(.bottom, 16)
                
                Button{
                    navModel.push(.filter)
                } label: {
                    Text("Уточнить время")
                        .foregroundColor(.uWhite)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 343, height: 60)
                        .background(.uBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 16)
    }
}

#Preview {
    NavigationStack {
        CarrierList(from: "Санкт-Петербург(Финляндский вокзал)",to: "Новосибирск(Новосибирск-Пассажирский)")
            .environmentObject(NavigationModel())
    }
}

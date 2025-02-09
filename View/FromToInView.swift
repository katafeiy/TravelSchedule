import SwiftUI

struct FromToInView: View {
    
    @State var goToCarrierList: Bool = false
    @State private var from: String = ""
    @State private var toIn: String = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        NavigationLink(destination: CitysListView(selectedCity: $from, onStationSelected: { station in
                            from = "\(from)(\(station))"
                        })) {
                        Text(from.isEmpty ? "Откуда" : from)
                                .foregroundColor(from.isEmpty ? .uGray : .uBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                        }
                        Divider()
                        NavigationLink(destination: CitysListView(selectedCity: $toIn, onStationSelected: { station in
                            toIn = "\(toIn)(\(station))"
                        })) {
                            Text(toIn.isEmpty ? "Куда" : toIn)
                                .foregroundColor(toIn.isEmpty ? .uGray : .uBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 20)
                                .padding(.leading, 20)
                        }
                    }
                    .background(.uWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Button {
                        swap(&from, &toIn)
                    } label: {
                        Image("change")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 36, height: 36)
                    .foregroundColor(.uBlue)
                    .background(.uWhite)
                    .clipShape(Circle())
                }
                
            }
            .padding(16)
            .background(.uBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            fineButton()
        }
    }
    
    func fineButton() -> some View {
        Button {
            self.goToCarrierList = true
        } label: {
            Text("Найти")
                .foregroundColor(.uWhite)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: 150, height: 60)
        .background(.uBlue)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .navigationDestination(isPresented: $goToCarrierList) {
            CarrierList(from: from, to: toIn)
        }
        .opacity(!from.isEmpty && !toIn.isEmpty ? 1 : 0)
    }
}

#Preview {
    FromToInView()
}

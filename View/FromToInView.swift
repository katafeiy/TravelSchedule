import SwiftUI

struct FromToInView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @State private var from: String = ""
    @State private var toIn: String = ""
    @State var goToCarrierList: Bool = false
    
    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        Button {
                            navModel.push(.cityFrom)
                        } label: {
                            Text(from.isEmpty ? "Откуда" : from)
                                .foregroundColor(from.isEmpty ? .uGray : .uBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                                .truncationMode(.tail)
                        }
                        Divider()
                        Button {
                            navModel.push(.cityTo)
                        } label: {
                            Text(toIn.isEmpty ? "Куда" : toIn)
                                .foregroundColor(toIn.isEmpty ? .uGray : .uBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 20)
                                .padding(.leading, 20)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                                .truncationMode(.tail)
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
            
        }
        .navigationDestination(for: ScreenNames.self) { screenNames in
            switch screenNames {
            case .cityFrom, .cityTo:
                CitysListView { city, station in
                    switch screenNames {
                    case .cityFrom:
                        from = "\(city) (\(station))"
                    case .cityTo:
                        toIn = "\(city) (\(station))"
                    }
                    navModel.popRoot()
                }
            }
        }
        fineButton()
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

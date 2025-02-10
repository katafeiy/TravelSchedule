import SwiftUI

struct FromToInView: View {
    
    @Binding var path: NavigationPath
    @State private var from: String = ""
    @State private var toIn: String = ""
    @State var goToCarrierList: Bool = false
    
    var body: some View {
        
        VStack(spacing: 16) {
            ZStack {
                HStack(spacing: 16) {
                    VStack (alignment: .leading, spacing: 15) {
                        Button {
                            path.append("CitySelectionFrom")
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
                            path.append("CitySelectionTo")
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
        .navigationDestination(for: String.self) { destination in
            if destination == "CitySelectionFrom" || destination == "CitySelectionTo" {
                CitysListView { city, station in
                    if destination == "CitySelectionFrom" {
                        from = "\(city) (\(station))"
                    } else {
                        toIn = "\(city) (\(station))"
                    }
                    path = NavigationPath()
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
    FromToInView(path: .constant(NavigationPath()))
}

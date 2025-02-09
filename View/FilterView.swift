import SwiftUI
import SwiftUI

struct FilterView: View {
    @State private var selectedTimes: Set<String> = []
    @State private var showTransfers: Bool? = nil

    let timeOptions = [
        ("Утро", "06:00 - 12:00"),
        ("День", "12:00 - 18:00"),
        ("Вечер", "18:00 - 00:00"),
        ("Ночь", "00:00 - 06:00")
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Время отправления")
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(nil)
                    
                    ForEach(timeOptions, id: \.0) { option in
                        HStack {
                            Text("\(option.0) \(option.1)")
                                .frame(height: 60)
                            Spacer()
                            Image(systemName: selectedTimes.contains(option.0) ? "checkmark.square.fill" : "square")
                                .onTapGesture {
                                    if selectedTimes.contains(option.0) {
                                        selectedTimes.remove(option.0)
                                    } else {
                                        selectedTimes.insert(option.0)
                                    }
                                }
                        }
                    }
                    Text("Показывать варианты с пересадками")
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(nil)
                    
                    HStack {
                        Text("Да")
                        Spacer()
                        Image(systemName: showTransfers == true ? "largecircle.fill.circle" : "circle")
                            .onTapGesture {
                                showTransfers = true
                            }
                    }
                    .frame(height: 60)
                    
                    HStack {
                        Text("Нет")
                        Spacer()
                        Image(systemName: showTransfers == false ? "largecircle.fill.circle" : "circle")
                            .onTapGesture {
                                showTransfers = false
                            }
                    }
                    .frame(height: 60)
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                Button {
                    
                } label: {
                    Text("Применить")
                        .foregroundColor(.uWhite)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 343, height: 60)
                        .background(.uBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .opacity(!selectedTimes.isEmpty ? 1 : 0)
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}


import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @Binding var selectedTimes: Set<String>
    @Binding var hasTransfers: Bool?
    @Binding var isActive: Bool
    
    static let timeOptions: [String: (start: String, end: String)] = [
        "Утро": ("06:00", "12:00"),
        "День": ("12:00", "18:00"),
        "Вечер": ("18:00", "23:59"),
        "Ночь": ("00:00", "05:59")
    ]
    
    var isFilterActive: Bool {
        !selectedTimes.isEmpty && hasTransfers != nil
    }
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button(action: {
                        navModel.pop(.schedule(.void))
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.ypBlack)
                            .font(.system(size: 20, weight: .regular))
                    }
                }
                .padding(.vertical, 10)
                
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .lineLimit(nil)
                
                ForEach(Self.timeOptions.sorted(by: { $0.key > $1.key }), id: \.key) { option in
                    HStack {
                        Text("\(option.key) \(option.value.start) - \(option.value.end)")
                            .frame(height: 60)
                        Spacer()
                        Image(systemName: selectedTimes.contains(option.key) ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                if selectedTimes.contains(option.key) {
                                    selectedTimes.remove(option.key)
                                } else {
                                    selectedTimes.insert(option.key)
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
                    Image(systemName: hasTransfers == true ? "largecircle.fill.circle" : "circle")
                        .onTapGesture {
                            hasTransfers = true
                        }
                }
                .frame(height: 60)
                
                HStack {
                    Text("Нет")
                    Spacer()
                    Image(systemName: hasTransfers == false ? "largecircle.fill.circle" : "circle")
                        .onTapGesture {
                            hasTransfers = false
                        }
                }
                .frame(height: 60)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 16)
            
            Button {
                navModel.pop(.schedule(.void))
                isActive = isFilterActive
            } label: {
                Text("Применить")
                    .foregroundColor(.uWhite)
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 343, height: 60)
                    .background(.uBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .opacity(isFilterActive ? 1 : 0)
        }
    }
}

#Preview {
    NavigationStack {
        FilterView(selectedTimes: .constant([]), hasTransfers: .constant(false), isActive: .constant(false))
            .environmentObject(NavigationModel())
    }
}


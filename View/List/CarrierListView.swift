import SwiftUI

struct CarrierListView: View {
    
    @EnvironmentObject var navModel: NavigationModel
    @StateObject var viewModel = CarrierListViewModel()
    @State var isActive: Bool = false
    @State var selectedTimes: Set<String> = []
    @State var hasTransfer: Bool?
    
    let fromStation: Station
    let toStation: Station
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    navModel.pop(.schedule(.void))
                    CacheDataBase.shared.carriers.removeAll()
                    isActive = false
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.horizontal, 16)
                }
                Spacer()
            }
            .padding(.vertical, 10)
            
            Text(fromStation.title + " -> " + toStation.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 16)
                .lineLimit(nil)
            Spacer()
            ZStack(alignment: .bottom) {
                if viewModel.isLoading {
                    CompassLoadingView()
                } else if viewModel.visibleCarrier.isEmpty {
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.uBlack)
                        .padding(.bottom, 350)
                } else {
                    List(viewModel.visibleCarrier) { carrier in
                        Button  {
                            navModel.push(.schedule(.carrierInfo(carrier)))
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
                    .padding(.bottom, 80)
                    
                    if !viewModel.isLoading {
                        Button{
                            navModel.push(.filter(.filter))
                        } label: {
                            HStack {
                                Text("Уточнить время")
                                Circle()
                                    .fill(isActive ? .uRed : .uBlue)
                                    .frame(width: 8, height: 8)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.uWhite)
                        .font(.system(size: 17, weight: .bold))
                        .background(.uBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                }
            }
            .navigationDestination(for: Screen.Filter.self) { _ in
                Route.filterFlowDestination(.filter, selectedTimes: $selectedTimes, hasTransfer: $hasTransfer, isActive: $isActive)
            }
            .onChange(of: hasTransfer) { _ in applyFilters()}
            .onChange(of: selectedTimes) { _ in applyFilters()}
            .navigationBarBackButtonHidden(true)
            .onAppear {
                Task {
                    try await viewModel.fetchCarriers(from: fromStation.codes.yandexCode ?? "", to: toStation.codes.yandexCode ?? "", transfers: true)
                }
            }
        }
    }
    private func applyFilters() {
        viewModel.filterCarriers(
            selectedTimes: selectedTimes,
            hasTransfers: hasTransfer,
            timeOptions: FilterView.timeOptions
        )
        
    }
}

#Preview {
    NavigationStack {
        CarrierListView(
            fromStation: PreviewMockData.shared.stationsMoscow[8],
            toStation: PreviewMockData.shared.stationsSanPetersburg[0]
        )
        .environmentObject(NavigationModel())
    }
}

import SwiftUI
import OpenAPIURLSession

final class TravelScheduleNetworkModel {
    
    static let shared = TravelScheduleNetworkModel()
    
    private func createService() throws -> TravelNetworkService {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        return TravelNetworkService(
            client: client,
            apiKey: Constant.apikey.stringValue
        )
    }
    
    //    @MainActor
    //    func mainRequest() async {
    //        do {
    //            try await scheduleBetweenStation()
    //            try await scheduleByStation()
    //            try await stationByThread()
    //            try await nearestStations()
    //            try await nearestSettlement()
    //            try await carrierInfo()
    //            try await allStations()
    //            try await copyright()
    //        } catch {
    //            print("Ошибка: \(error.localizedDescription)")
    //        }
    //    }
    
    func scheduleBetweenStation() async throws {
        let service = try createService()
        print("Получаем объекты scheduleBetweenStation")
        let schedule = try await service.getScheduleRouteBetweenStation(from: "s9600213", to: "s9600216")
        print("Получили обЪекты \(schedule)\n")
    }
    
    func scheduleByStation() async throws {
        let service = try createService()
        print("Получаем объекты scheduleByStation")
        let schedule = try await service.getScheduleRouteByStation(station: "s9600213")
        print("Получили обЪекты \(schedule)\n")
    }
    
    func stationByThread() async throws {
        let service = try createService()
        print("Получаем объекты stationByThread")
        let station = try await service.getStationsByThread(uid: "028S_3_2")
        print("Получили обЪекты \(station)\n")
    }
    
    func nearestStations() async throws {
        let service = try createService()
        print("Получаем объекты Station")
        let stations = try await service.getNearestStations(lat: 52.520008, lng: 13.404954, distance: 50)
        print("Получили обЪекты \(stations)\n")
    }
    
    func nearestSettlement() async throws {
        let service = try createService()
        print("Получаем объекты nearestSettlement")
        let settlement = try await service.getNearestSettlement(lat: 52.520008, lng: 13.404954)
        print("Получили обЪекты \(settlement)\n")
    }
    
    func carrierInfo() async throws {
        let service = try createService()
        print("Получаем объекты carrierInfo")
        let carrier = try await service.getCarrierInfo(code: 680)
        print("Получили обЪекты \(carrier)\n")
    }
    
    func allStations() async throws -> CountryData {
        let service = try createService()
//        print("Получаем объекты allStations")
        let data = try await service.getAllStationsList()
//        print("Получили обЪекты \(data)\n")
        
        let countries: [Country] = data.countries?.compactMap { country in
            
            let regions: [Region] = country.regions?.compactMap { region in
                
                let settlements: [Settlement] = region.settlements?.compactMap { settlement in
                    
                    let stations: [Station] = settlement.stations?.compactMap { station in
                        
                        Station(
                            direction: station.direction ?? "",
                            codes: StationCodes(yandexCode: station.codes?.yandex ?? "", esrCode: station.codes?.esr ?? ""),
                            stationType: station.station_type ?? "",
                            title: station.title ?? "",
                            longitude: station.lng ?? 0.0,
                            transportType: station.transport_type ?? "",
                            latitude: station.lat ?? 0.0
                        )
                    } ?? []
                    
                    return Settlement(title: settlement.title ?? "",
                               codes: Codes(yandexCode: region.codes?.yandex_code ?? "" , esrCode: region.codes?.esr_code ?? ""),
                               stations: stations)
                } ?? []
                
                return Region(title: region.title ?? "" ,
                       codes: Codes(yandexCode: region.codes?.yandex_code ?? "" , esrCode: region.codes?.esr_code ?? ""),
                       settlements: settlements)
            } ?? []
            
            return Country(
                title: country.title ?? "",
                codes: Codes(yandexCode: country.codes?.yandex ?? "", esrCode: country.codes?.esr ?? ""),
                regions: regions
            )
        } ?? []
        
        return CountryData(countries: countries)
    }
    
    func copyright() async throws {
        let service = try createService()
        print("Получаем объекты copyright")
        let copyright = try await service.getCopyright()
        print("Получили обЪекты \(copyright)\n")
    }
}


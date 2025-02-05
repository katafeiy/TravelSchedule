import SwiftUI
import OpenAPIURLSession

class TravelScheduleViewModel: ObservableObject {
    
    private func createService() throws -> TravelNetworkService {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        return TravelNetworkService(
            client: client,
            apiKey: APIKey.apikey.stringValue
        )
    }
    
    @MainActor
    func mainRequest() async {
        do {
            try await scheduleBetweenStation()
            try await scheduleByStation()
            try await stationByThread()
            try await nearestStations()
            try await nearestSettlement()
            try await carrierInfo()
//            try await allStations()
            try await copyright()
        } catch {
            print("Ошибка: \(error.localizedDescription)")
        }
    }
    
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
    
    func allStations() async throws {
        let service = try createService()
        print("Получаем объекты allStations")
        let stations = try await service.getAllStationsList()
        print("Получили обЪекты \(stations)\n")
    }
    
    func copyright() async throws {
        let service = try createService()
        print("Получаем объекты copyright")
        let copyright = try await service.getCopyright()
        print("Получили обЪекты \(copyright)\n")
    }
}


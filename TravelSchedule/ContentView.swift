import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear(){
            Task {
                print("Получаем объекты scheduleBetweenStation")
                try scheduleBetweenStation()
                
                print("Получаем объекты scheduleByStation")
                try scheduleByStation()
                
                print("Получаем объекты stationByThread")
                try stationByThread()
                
                print("Получаем объекты nearestSettlement")
                try nearestSettlement()
                
                print("Получаем объекты carrierInfo")
                try carrierInfo()
                
                print("Получаем объекты Station")
                try nearestStations()

                print("Получаем объекты allStations")
                try allStations()
                
                print("Получаем объекты copyright")
                try copyright()
            }
        }
        .padding()
    }
    
    func scheduleBetweenStation() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ScheduleRouteBetweenStationService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let stations = try await service.getScheduleRouteBetweenStation(from: "s9600213", to: "s9600216")
                print(stations)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleByStation() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ScheduleRouteByStationService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let stations = try await service.getScheduleRouteByStation(station: "s9600213")
                print(stations)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func stationByThread() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = StationsByThreadService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let station = try await service.getStationsByThread(uid: "028S_3_2")
                print(station)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func nearestSettlement() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestSettlementService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let settlement = try await service.getNearestSettlement(lat: 52.520008, lng: 13.404954)
                print(settlement)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func nearestStations() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do{
                let stations = try await service.getNearestStations(lat: 52.520008, lng: 13.404954, distance: 50)
                print(stations)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func carrierInfo() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = CarrierInfoService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let carrierInfo = try await service.getCarrierInfo(code: 680)
                print(carrierInfo)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func allStations() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = AllStationsListService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do{
                let stations = try await service.getAllStationsList()
                print(stations)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func copyright() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = CopyrightService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            do {
                let copyright = try await service.getCopyright()
                print(copyright)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}

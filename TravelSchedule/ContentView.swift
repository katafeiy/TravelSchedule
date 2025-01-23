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
//               try stations()
                    try route()
            }
        }
        .padding()
        
    }
    func stations() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            let stations = try await service.getNearestStations(lat: 52.520008, lng: 13.404954, distance: 50)
            print(stations)
        }
    }
    
    func route() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ScheduleRouteByStationService(
            client: client,
            apiKey: "6cf81d84-1f01-4f3b-b53c-214afd378412"
        )
        
        Task {
            let stations = try await service.getScheduleRouteByStation(station: "s9600213")
            print(stations)
        }
    }
}

#Preview {
    ContentView()
}

import SwiftUI
import OpenAPIURLSession

final class TravelScheduleNetworkModel {
    
    @MainActor static let shared = TravelScheduleNetworkModel()
    
    private var service: TravelNetworkService
    
    private init() {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            service = TravelNetworkService(
                client: client,
                apiKey: Constant.apikey.stringValue
            )
        } catch {
            fatalError("Не удалось создать сервис: \(error.localizedDescription)")
        }
    }
    
    func scheduleBetweenStation(from: String, to: String, transfers: Bool) async throws -> ScheduleResponse {
        print("Получаем объекты scheduleBetweenStation")
        let data = try await service.getScheduleRouteBetweenStation(from: from, to: to, transfers: transfers)
        print("Получили обЪекты \(data)\n")
        
        let intervalSegments = data.interval_segments?.compactMap { segmentsItem in
            
            return IntervalSegment(
                from: StationResponse(code: segmentsItem.from?.code ?? "",
                                      title: segmentsItem.from?.title ?? "",
                                      popularTitle: segmentsItem.from?.popular_title,
                                      shortTitle: segmentsItem.from?.short_title,
                                      transportType: segmentsItem.from?.transport_type ?? "",
                                      type: segmentsItem.from?._type ?? "",
                                      stationType: segmentsItem.from?.station_type,
                                      stationTypeName: segmentsItem.from?.station_type_name),
                thread: Thread(uid: segmentsItem.thread?.uid ?? "",
                               title: segmentsItem.thread?.title ?? "",
                               interval: segmentsItem.thread?.interval.map {
                                   Interval(density: $0.density,
                                            endTime: $0.end_time,
                                            beginTime: $0.begin_time)
                               },
                               number: segmentsItem.thread?.number ?? "",
                               shortTitle: segmentsItem.thread?.short_title ?? "",
                               threadMethodLink: segmentsItem.thread?.thread_method_link ?? "",
                               carrier: CarrierResponse(code: segmentsItem.thread?.carrier?.code ?? 0,
                                                        contacts: segmentsItem.thread?.carrier?.contacts,
                                                        url: segmentsItem.thread?.carrier?.url,
                                                        logoSvg: segmentsItem.thread?.carrier?.logo_svg,
                                                        title: segmentsItem.thread?.carrier?.title ?? "",
                                                        phone: segmentsItem.thread?.carrier?.phone,
                                                        codes: CarrierCodes(icao: segmentsItem.thread?.carrier?.codes?.icao,
                                                                            sirena: segmentsItem.thread?.carrier?.codes?.sirena,
                                                                            iata: segmentsItem.thread?.carrier?.codes?.iata),
                                                        address: segmentsItem.thread?.carrier?.address,
                                                        logo: segmentsItem.thread?.carrier?.logo,
                                                        email: segmentsItem.thread?.carrier?.email),
                               transportType: segmentsItem.thread?.transport_type ?? "",
                               vehicle: segmentsItem.thread?.vehicle,
                               transportSubtype: segmentsItem.thread?.transport_subtype.map {
                                   TransportSubtype(color: $0.color,
                                                    code: $0.code,
                                                    title: $0.title)
                               },
                               expressType: segmentsItem.thread?.express_type),
                departurePlatform: segmentsItem.departure_platform,
                stops: segmentsItem.stops,
                departureTerminal: segmentsItem.departure_terminal,
                to: StationResponse(code: segmentsItem.to?.code ?? "",
                                    title: segmentsItem.to?.title ?? "",
                                    popularTitle: segmentsItem.to?.popular_title,
                                    shortTitle: segmentsItem.to?.short_title,
                                    transportType: segmentsItem.to?.transport_type ?? "",
                                    type: segmentsItem.to?._type ?? "",
                                    stationType: segmentsItem.to?.station_type,
                                    stationTypeName: segmentsItem.to?.station_type_name),
                hasTransfers: segmentsItem.has_transfers ?? false,
                ticketsInfo: TicketsInfo(
                    etMarker: segmentsItem.tickets_info?.et_marker ?? false,
                    places: segmentsItem.tickets_info?.places?.map {
                        TicketPlace(
                            currency: $0.currency ?? "",
                            price: Price(
                                cents: Int($0.price?.first?.cents ?? 0.0),
                                whole: Int($0.price?.first?.whole ?? 0.0)),
                            name: $0.name ?? "")
                    } ?? []
                ),
                duration: Int(segmentsItem.duration ?? 0.0),
                arrivalTerminal: segmentsItem.arrival_terminal,
                startDate: segmentsItem.start_date ?? "",
                arrivalPlatform: segmentsItem.arrival_platform)
        } ?? []
        
        let segments: [Segment] = data.segments?.compactMap { segment in
            
            return Segment(
                arrival: segment.arrival ?? "",
                from: StationResponse(
                    code: segment.from?.code ?? "",
                    title: segment.from?.title ?? "",
                    popularTitle: segment.from?.popular_title ?? "",
                    shortTitle: segment.from?.short_title ?? "",
                    transportType: segment.from?.transport_type ?? "",
                    type: segment.from?._type ?? "",
                    stationType: segment.from?.station_type ?? "",
                    stationTypeName: segment.from?.station_type_name ?? "" ),
                thread: Thread(uid: segment.thread?.uid ?? "",
                               title: segment.thread?.title ?? "",
                               interval: segment.thread?.interval.map {
                                   Interval(density: $0.density,
                                            endTime: $0.end_time,
                                            beginTime: $0.begin_time)
                               },
                               number: segment.thread?.number ?? "",
                               shortTitle: segment.thread?.short_title ?? "",
                               threadMethodLink: segment.thread?.thread_method_link ?? "",
                               carrier: CarrierResponse(code: segment.thread?.carrier?.code ?? 0,
                                                        contacts: segment.thread?.carrier?.contacts,
                                                        url: segment.thread?.carrier?.url,
                                                        logoSvg: segment.thread?.carrier?.logo_svg,
                                                        title: segment.thread?.carrier?.title ?? "",
                                                        phone: segment.thread?.carrier?.phone,
                                                        codes: segment.thread?.carrier?.codes.map { codes in
                                                            CarrierCodes(icao: codes.icao ?? "",
                                                                         sirena: codes.sirena ?? "",
                                                                         iata: codes.iata ?? "")
                                                        } ?? CarrierCodes(icao: "", sirena: "", iata: ""),
                                                        address: segment.thread?.carrier?.address,
                                                        logo: segment.thread?.carrier?.logo,
                                                        email: segment.thread?.carrier?.email),
                               transportType: segment.thread?.transport_type ?? "",
                               vehicle: segment.thread?.vehicle,
                               transportSubtype: segment.thread?.transport_subtype.map {
                                   TransportSubtype(color: $0.color,
                                                    code: $0.code,
                                                    title: $0.title)
                               },
                               expressType: segment.thread?.express_type),
                departurePlatform: segment.departure_platform,
                departure: segment.departure ?? "",
                stops: segment.stops,
                departureTerminal: segment.departure_terminal,
                to: StationResponse(code: segment.to?.code ?? "",
                                    title: segment.to?.title ?? "",
                                    popularTitle: segment.to?.popular_title ?? "",
                                    shortTitle: segment.to?.short_title ?? "",
                                    transportType: segment.to?.transport_type ?? "",
                                    type: segment.to?._type ?? "",
                                    stationType: segment.to?.station_type ?? "",
                                    stationTypeName: segment.to?.station_type_name ?? ""),
                hasTransfers: segment.has_transfers ?? false,
                ticketsInfo: TicketsInfo(
                    etMarker: segment.tickets_info?.et_marker ?? false,
                    places: segment.tickets_info?.places?.map {
                        TicketPlace(
                            currency: $0.currency ?? "",
                            price: Price(
                                cents: Int($0.price?.first?.cents ?? 0.0),
                                whole: Int($0.price?.first?.whole ?? 0.0)),
                            name: $0.name ?? "")
                    } ?? []
                ),
                duration: segment.duration ?? 0,
                arrivalTerminal: segment.arrival_terminal,
                startDate: segment.start_date ?? "",
                arrivalPlatform: segment.arrival_platform)
        } ?? []
        
        return ScheduleResponse(pagination: Pagination(total: Int(data.pagination?.total ?? 0.0) ,
                                                       limit: Int(data.pagination?.limit ?? 0.0),
                                                       offset: Int(data.pagination?.offset ?? 0.0)),
                                intervalSegments: intervalSegments,
                                segments: segments,
                                search: Search(date: data.search?.date ?? "",
                                               to: data.search?.to.map {
            SettlementResponse(code: $0.code ?? "",
                               type: $0._type ?? "",
                               popularTitle: $0.popular_title,
                               shortTitle: $0.short_title,
                               title: $0.title ?? "")
        } ?? SettlementResponse(code: "", type: "", popularTitle: nil, shortTitle: nil, title: ""),
                                               from: data.search?.from.map {
            SettlementResponse(code: $0.code ?? "",
                               type: $0._type ?? "",
                               popularTitle: $0.popular_title,
                               shortTitle: $0.short_title,
                               title: $0.title ?? "")
        } ?? SettlementResponse(code: "", type: "", popularTitle: nil, shortTitle: nil, title: "")))
    }
    
    func scheduleByStation() async throws {
        print("Получаем объекты scheduleByStation")
        let schedule = try await service.getScheduleRouteByStation(station: "s9600213")
        print("Получили обЪекты \(schedule)\n")
    }
    
    func stationByThread() async throws {
        print("Получаем объекты stationByThread")
        let station = try await service.getStationsByThread(uid: "028S_3_2")
        print("Получили обЪекты \(station)\n")
    }
    
    func nearestStations() async throws {
        print("Получаем объекты Station")
        let stations = try await service.getNearestStations(lat: 52.520008, lng: 13.404954, distance: 50)
        print("Получили обЪекты \(stations)\n")
    }
    
    func nearestSettlement() async throws {
        print("Получаем объекты nearestSettlement")
        let settlement = try await service.getNearestSettlement(lat: 52.520008, lng: 13.404954)
        print("Получили обЪекты \(settlement)\n")
    }
    
    func carrierInfo() async throws {
        print("Получаем объекты carrierInfo")
        let carrier = try await service.getCarrierInfo(code: 680)
        print("Получили обЪекты \(carrier)\n")
    }
    
    func allStations() async throws -> CountryData {
        print("Получаем объекты allStations")
        let data = try await service.getAllStationsList()
        print("Получили обЪекты")
        
        let countries: [Country] = data.countries?.compactMap { country in
            
            let regions: [Region] = country.regions?.compactMap { region in
                
                let settlements: [Settlement] = region.settlements?.compactMap { settlement in
                    
                    let stations: [Station] = settlement.stations?.compactMap { station in
                        
                        Station(
                            direction: station.direction ?? "",
                            codes: StationCodes(yandexCode: station.codes?.yandex_code ?? "", esrCode: station.codes?.esr_code ?? ""),
                            stationType: station.station_type ?? "",
                            title: station.title ?? "Название станции не указано",
                            longitude: station.lng ?? 0.0,
                            transportType: station.transport_type ?? "",
                            latitude: station.lat ?? 0.0)
                    } ?? []
                    
                    return Settlement(title: settlement.title ?? "Название города не указано",
                                      codes: Codes(yandexCode: region.codes?.yandex_code ?? "" , esrCode: region.codes?.esr_code ?? ""),
                                      stations: stations)
                } ?? []
                
                return Region(title: region.title ?? "Название региона не указано" ,
                              codes: Codes(yandexCode: region.codes?.yandex_code ?? "" , esrCode: region.codes?.esr_code ?? ""),
                              settlements: settlements)
            } ?? []
            
            return Country(
                title: country.title ?? "",
                codes: Codes(yandexCode: country.codes?.yandex ?? "", esrCode: country.codes?.esr ?? ""),
                regions: regions)
        } ?? []
        
        return CountryData(countries: countries)
    }
    
    func copyright() async throws {
        print("Получаем объекты copyright")
        let copyright = try await service.getCopyright()
        print("Получили обЪекты \(copyright)\n")
    }
}


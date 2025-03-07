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
    
    func scheduleBetweenStation(from: String, to: String) async throws -> ScheduleResponse {
        let service = try createService()
        print("Получаем объекты scheduleBetweenStation")
        let data = try await service.getScheduleRouteBetweenStation(from: from, to: to)
        print("Получили обЪекты \(data)\n")
        
        let intervalSegments: [IntervalSegment] = data.interval_segments?.compactMap { segmentsItem in
            guard let from = segmentsItem.from,
                  let to = segmentsItem.to,
                  let thread = segmentsItem.thread,
                  let ticketsInfo = segmentsItem.tickets_info else { return nil }
            
            return IntervalSegment(
                from: StationResponse(code: from.code,
                                      title: from.title,
                                      popularTitle: from.popular_title,
                                      shortTitle: from.short_title,
                                      transportType: from.transport_type,
                                      type: from._type,
                                      stationType: from.station_type,
                                      stationTypeName: from.station_type_name
                                     ),
                thread: Thread(uid: thread.uid,
                               title: thread.title,
                               interval: thread.interval?.map {
                                   Interval(density: $0.density,
                                            endTime: $0.end_time,
                                            beginTime: $0.begin_time)
                               },
                               number: thread.number,
                               shortTitle: thread.short_title,
                               threadMethodLink: thread.thread_method_link,
                               carrier: CarrierResponse(code: thread.carrier?.code,
                                                        contacts: thread.carrier?.contacts,
                                                        url: thread.carrier?.url,
                                                        logoSvg: thread.carrier?.logo_svg,
                                                        title: thread.carrier?.title,
                                                        phone: thread.carrier?.phone,
                                                        codes: CarrierCodes(icao: thread.carrier?.codes.icao,
                                                                            sirena: thread.carrier?.codes?.sirena,
                                                                            iata: thread.carrier?.codes?.iata),
                                                        address: thread.carrier?.address,
                                                        logo: thread.carrier?.logo,
                                                        email: thread.carrier?.email),
                               
                               transportType: thread.transport_type,
                               vehicle: thread.vehicle,
                               transportSubtype: thread.transport_subtype.map {
                                   TransportSubtype(color: $0.color,
                                                    code: $0.code,
                                                    title: $0.title)
                               },
                               expressType: thread.express_type
                              ),
                departurePlatform: thread.departure_platform,
                stops: segmentsItem.stops,
                departureTerminal: segmentsItem.departure_terminal,
                to: StationResponse(code: to.code,
                                    title: to.title,
                                    popularTitle: to.popular_title,
                                    shortTitle: to.short_title,
                                    transportType: to.transport_type,
                                    type: to._type,
                                    stationType: to.station_type,
                                    stationTypeName: to.station_type_name
                                   ),
                hasTransfers: segmentsItem.has_transfers ?? false,
                ticketsInfo: ticketsInfo.map {
                    TicketsInfo(etMarker: $0.et_marker,
                                places: $0.places.map {
                        TicketPlace(currency: $0.currency,
                                    price: Price(cents: $0.price.cents,
                                                 whole: $0.price.whole),
                                    name: $0.name)
                    })
                },
                duration: segmentsItem.duration ?? 0,
                arrivalTerminal: segmentsItem.arrival_terminal,
                startDate: segmentsItem.start_date ?? "",
                arrivalPlatform: segmentsItem.arrival_platform
            )
        } ?? []
        
        let segments: [Segment] = data.segments?.compactMap { segment in
            
            guard let from = segment.from,
                  let to = segment.to,
                  let thread = segment.thread,
                  let ticketsInfo = segment.tickets_info else { return nil }
            
            return Segment(
                arrival: segment.arrival,
                from: StationResponse(
                    code: from.code,
                    title: from.title,
                    popularTitle: from.popular_title,
                    shortTitle: from.short_title,
                    transportType: from.transport_type,
                    type: from._type,
                    stationType: from.station_type,
                    stationTypeName: from.station_type_name),
                thread: Thread(uid: thread.uid,
                               title: thread.title,
                               interval: thread.interval?.map {
                                   Interval(density: $0.density,
                                            endTime: $0.end_time,
                                            beginTime: $0.begin_time)
                               },
                               number: thread.number,
                               shortTitle: thread.short_title,
                               threadMethodLink: thread.thread_method_link,
                               carrier: CarrierResponse(code: thread.carrier?.code,
                                                        contacts: thread.carrier?.contacts,
                                                        url: thread.carrier?.url,
                                                        logoSvg: thread.carrier?.logo_svg,
                                                        title: thread.carrier?.title,
                                                        phone: thread.carrier?.phone,
                                                        codes: thread.carrier?.codes?.map {
                                                            CarrierCodes(icao: $0.icao,
                                                                         sirena: $0.sirena,
                                                                         iata: $0.iata)
                                                        },
                                                        address: thread.carrier?.address,
                                                        logo: thread.carrier?.logo,
                                                        email: thread.carrier?.email),
                               
                               transportType: thread.transport_type,
                               vehicle: thread.vehicle,
                               transportSubtype: thread.transport_subtype.map {
                                   TransportSubtype(color: $0.color,
                                                    code: $0.code,
                                                    title: $0.title)
                               }),
                departurePlatform: segment.departure_platform,
                departure: segment.departure,
                stops: segment.stops,
                departureTerminal: segment.departure_terminal,
                to: StationResponse(code: to.code,
                                    title: to.title,
                                    popularTitle: to.popular_title,
                                    shortTitle: to.short_title,
                                    transportType: to.transport_type,
                                    type: to._type,
                                    stationType: to.station_type,
                                    stationTypeName: to.station_type_name
                                   ),
                hasTransfers: segment.has_transfers,
                ticketsInfo: ticketsInfo.map {
                    TicketsInfo(etMarker: $0.et_marker,
                                places: $0.places.map {
                        TicketPlace(currency: $0.currency,
                                    price: Price(cents: $0.price.cents,
                                                 whole: $0.price.whole),
                                    name: $0.name)
                    })
                },
                duration: segment.duration,
                arrivalTerminal: segment.arrival_terminal,
                startDate: segment.start_date,
                arrivalPlatform: segment.arrival_platform
            )
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
        } ?? SettlementResponse(code: "", type: "", popularTitle: nil, shortTitle: nil, title: ""))
        )
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
                            codes: StationCodes(yandexCode: station.codes?.yandex_code ?? "", esrCode: station.codes?.esr_code ?? ""),
                            stationType: station.station_type ?? "",
                            title: station.title ?? "Название станции не указано",
                            longitude: station.lng ?? 0.0,
                            transportType: station.transport_type ?? "",
                            latitude: station.lat ?? 0.0
                        )
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


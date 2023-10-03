//
//  LocationService.swift
//  OFFODemo
//
//  Created by Павел Барташов on 21.09.2023.
//

//protocol ServiceLocatorProtocol {
//    func register(service: U, ofType type: T) { }
//    func resolve(service type: T) -> U { }
//}
//
//final class ServiceLocator<T: Any.Type, U> {
//
//    private var services: [Any.Type: U] = [:]
//
//    func register(service: U, ofType type: T) {
//        services[type] = service
//    }
//
//    func resolve(service type: T) -> U {
//        guard let service = services[type] else {
//            fatalError("Service \(type) not found")
//        }
//
//        return service
//    }
//
//}

//
//  CounterListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 14.09.2023.
//

import Foundation
//import Combine

//protocol CounterViewModelProtocol: ObservableObject {
////    var roomsPublisher: Published<[RoomViewModel]>.Publisher { get }
//    var name: String { get }
//    var serialNumber: String { get }
//}
//


public struct CounterListViewModel {

    // MARK: - Properties

//    var counter: Counter {
//        didSet {
//            update()
//        }
//    }

//    var name: String = ""
    public let id: UUID
    var type: CounterType
    var serialNumber: String

    // MARK: - LifeCicle

    init(counter: Counter) {
        self.id = counter.id
        self.type = counter.type
        self.serialNumber = counter.serialNumber
    }

    // MARK: - Metods

//    private mutating func update() {
//        name = counter.serialNumber
////        counters = room.counters.compactMap { makeCounterViewModel($0) }
//    }
}

extension CounterListViewModel: Identifiable {
//    public var id: UUID {
//        counter.id
//    }
}

extension CounterListViewModel {
    var typeTitle: String {
        switch type {
            case .unknown:
                "unknown"
            case .coldWater:
                "coldWater"
            case .hotWater:
                "hotWater"
            case .electric:
                "electric"
            case .heat:
                "heat"
                //            case .gas:
                //                "gas".localized
        }
    }

    var typeAsEmoji: String {
        switch type {
            case .unknown:
                "?"
            case .coldWater:
                "❄"
            case .hotWater:
                "♨"
            case .electric:
                "⌁"
            case .heat:
                "☀"
                //            case .gas:
                //                "☁"
        }
    }

}

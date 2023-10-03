//
//  RoomListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 16.09.2023.
//

import Foundation
//import Combine

//protocol RoomViewModelProtocol: ObservableObject {
//    var name: String { get }
//    var counters: [any CounterViewModelProtocol] { get }
//}

struct RoomListViewModel {

    // MARK: - Properties

//    private let makeCounterViewModel: (Counter) -> CounterListViewModel

    var id: UUID
    var name: String = ""
    var counters: [CounterListViewModel] = []

    // MARK: - LifeCicle

    init(room: Room,
         makeCounterViewModel: @escaping (Counter) -> CounterListViewModel
    ) {
//        self.makeCounterViewModel = makeCounterViewModel

        id = room.id
        name = room.name
        counters = room.counters.compactMap { makeCounterViewModel($0) }   }

    // MARK: - Metods

//    mutating func update(room: Room) {
//
//    }
}

extension RoomListViewModel: Identifiable {
//    var id: UUID {
//        room.id
//    }
}

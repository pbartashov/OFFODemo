//
//  ViewModelMaker.swift
//  OFFODemo
//
//  Created by Павел Барташов on 17.09.2023.
//

import Foundation

struct ViewModelMakerSample {
    static func makeRoomViewModel(_ room: Room) -> RoomListViewModel {
        RoomListViewModel(room: room, makeCounterViewModel: makeCounterViewModel(_:))
    }

    static func makeCounterViewModel(_ counter: Counter) -> CounterListViewModel {
        CounterListViewModel(counter: counter)
    }
}

//
//  CounterListViewModelSample.swift.swift
//  OFFODemo
//
//  Created by Павел Барташов on 15.09.2023.
//

import Foundation

final class CounterListViewModelSample: ObservableObject, CounterListViewModelProtocol {
    @Published var rooms: [Room] = Room.sampleData
    var roomsPublisher: Published<[Room]>.Publisher { $rooms }
}

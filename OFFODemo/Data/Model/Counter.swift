//
//  Counter.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

struct Counter {
    var id: UUID
    var type: CounterType
    var room: Room
    var serialNumber: String
    var account: String
    var isTwoTariff: Bool
}

extension Counter: Hashable { }
//extension Counter: Identifiable { }

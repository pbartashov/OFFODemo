//
//  Counter.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

public struct Counter {
    var id: UUID = UUID()
    var type: CounterType
    var roomID: UUID
    var serialNumber: String
    var account: String
    var isTwoTariff: Bool
}

extension Counter: Hashable { }
//extension Counter: Identifiable { }

//
//  Counter.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

public struct Counter {
    let id: UUID
    var type: CounterType
    var roomID: UUID
    var serialNumber: String
    var account: String
    var isTwoTariff: Bool

    init(
        id: UUID = UUID(),
        type: CounterType = .unknown,
        roomID: UUID,
        serialNumber: String,
        account: String = "",
        isTwoTariff: Bool = false
    ) {
        self.id = id
        self.type = type
        self.roomID = roomID
        self.serialNumber = serialNumber
        self.account = account
        self.isTwoTariff = isTwoTariff
    }
}

extension Counter: Hashable { }
//extension Counter: Identifiable { }

extension Counter {
    static var emptyCounter: Counter {
        Counter(roomID: UUID(), serialNumber: "")
    }
}

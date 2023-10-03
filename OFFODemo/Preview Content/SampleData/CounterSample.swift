//
//  CounterSample.swift
//  OFFODemo
//
//  Created by Павел Барташов on 19.09.2023.
//

import Foundation

extension Counter {
    static let counterSampleBath1 = Counter(
        type: .coldWater,
        roomID: Room.bath.id,
        serialNumber: "123",
        account: "12-12-12",
        isTwoTariff: false
    )

    static let counterSampleBath2 = Counter(
        type: .hotWater,
        roomID: Room.bath.id,
        serialNumber: "1234",
        account: "12-12-12",
        isTwoTariff: false
    )

    static let counterSampleToilet1 = Counter(
        type: .coldWater,
        roomID: Room.toilet.id,
        serialNumber: "1235",
        account: "12-12-12-23",
        isTwoTariff: true
    )

    static let counterSampleKitchen1 = Counter(
        type: .electric,
        roomID: Room.kitchen.id,
        serialNumber: "112356",
        account: "we12@",
        isTwoTariff: true
    )

    static let counterSampleKitchen2 = Counter(
        type: .heat,
        roomID: Room.kitchen.id,
        serialNumber: "112356-15",
        account: "heat12",
        isTwoTariff: false
    )
}

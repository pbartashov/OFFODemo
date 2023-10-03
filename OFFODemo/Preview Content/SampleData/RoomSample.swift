//
//  Room.swift
//  OFFODemo
//
//  Created by Павел Барташов on 15.09.2023.
//

extension Room {
    static var kitchen = Room(name: "Kitchen")
    static var bath = Room(name: "Bath")
    static var toilet = Room(name: "Toilet")

    static let sampleData = {
        [Counter.counterSampleBath1, Counter.counterSampleBath2]
            .forEach { kitchen.counters.insert($0) }

        [Counter.counterSampleBath1, Counter.counterSampleBath2]
            .forEach { bath.counters.insert($0) }

        toilet.counters.insert(Counter.counterSampleToilet1)

        return [kitchen, bath, toilet]
    }()
}

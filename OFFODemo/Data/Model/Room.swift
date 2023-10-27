//
//  Room.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

public struct Room {

    // MARK: - Properties

    public let id: UUID
    var name: String
    var counters: Set<Counter>

    // MARK: - LifeCicle

    internal init(id: UUID = UUID(), name: String, counters: Set<Counter> = []) {
        self.id = id
        self.name = name
        self.counters = counters
    }
}

extension Room: Hashable { }
extension Room: Identifiable { }


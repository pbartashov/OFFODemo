//
//  Room.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

public struct Room {
    public var id: UUID = UUID()
    var name: String
    var counters: Set<Counter> = []
}

extension Room: Hashable { }
extension Room: Identifiable { }

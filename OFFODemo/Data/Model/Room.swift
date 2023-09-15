//
//  Room.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

struct Room {
    let id: UUID = UUID()
    let name: String
}

extension Room: Hashable { }
extension Room: Identifiable { }

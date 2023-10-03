//
//  RoomStorageSample.swift
//  OFFODemo
//
//  Created by Павел Барташов on 17.09.2023.
//

import Combine
import Foundation

struct RoomStorageSample: DomainModelRepositoryProtocol {
    typealias DomainModelType = Room

    var domainModelsPublisher: AnyPublisher<[Room], Never>
    var rooms: [Room]

    init(rooms: [Room] = Room.sampleData) {
        self.rooms = rooms
        self.domainModelsPublisher = CurrentValueSubject(rooms).eraseToAnyPublisher()
    }

    func getDomainModels(predicate: NSPredicate?) async throws -> [Room] {
        rooms
    }

    func create(domainModel: Room) async throws {
        fatalError("Hey, i'm just a sample!")
    }

    func save(domainModel: Room) async throws {
        fatalError("Hey, i'm just a sample!")
    }

    func delete(domainModel: Room) async throws {
        fatalError("Hey, i'm just a sample!")
    }

    func saveChanges() async throws {
        fatalError("Hey, i'm just a sample!")
    }

    func startFetchingWith(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) throws {
        fatalError("Hey, i'm just a sample!")
    }
}

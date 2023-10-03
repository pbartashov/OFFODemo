//
//  RoomEntity+.swift
//  OFFODemo
//
//  Created by Павел Барташов on 27.09.2023.
//

import Foundation
import CoreDataStorage

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
extension RoomEntity: DomainModelConvertible {
    public typealias DomainModelType = Room

    public func toDomainModel() -> DomainModelType {
        let counterDomainModels = counters?.compactMap {
            ($0 as? CounterEntity)?.toDomainModel()
        }
        return Room(id: uid ?? UUID(),
                    name: name ?? "",
                    counters: Set(counterDomainModels ?? []))
    }

    public func copyDomainModel(model: DomainModelType) {
        uid = model.id
        name = model.name
        addToCounters(NSSet(array: model.counters.compactMap {
            let counterEntity: CounterEntity? = managedObjectContext?.getEntity(forUid: $0.id)
            counterEntity?.copyDomainModel(model: $0)

            return counterEntity
        }))
    }
}

extension RoomEntity: UUIDIdentifiable { }

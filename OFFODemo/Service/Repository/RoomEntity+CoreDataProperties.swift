//
//  RoomEntity+CoreDataProperties.swift
//  OFFODemo
//
//  Created by Павел Барташов on 19.09.2023.
//
//

import Foundation
import CoreData


extension RoomEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomEntity> {
        return NSFetchRequest<RoomEntity>(entityName: "RoomEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var uid: UUID?
    @NSManaged public var counters: NSSet?

}

// MARK: Generated accessors for counters
extension RoomEntity {

    @objc(addCountersObject:)
    @NSManaged public func addToCounters(_ value: CounterEntity)

    @objc(removeCountersObject:)
    @NSManaged public func removeFromCounters(_ value: CounterEntity)

    @objc(addCounters:)
    @NSManaged public func addToCounters(_ values: NSSet)

    @objc(removeCounters:)
    @NSManaged public func removeFromCounters(_ values: NSSet)

}

//extension RoomEntity : Identifiable {
//
//}

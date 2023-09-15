//
//  CounterEntity+CoreDataProperties.swift
//  OFFODemo
//
//  Created by Павел Барташов on 14.09.2023.
//
//

import Foundation
import CoreData


extension CounterEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CounterEntity> {
        return NSFetchRequest<CounterEntity>(entityName: "CounterEntity")
    }

    @NSManaged public var account: String?
    @NSManaged public var isTwoTariff: Bool
    @NSManaged public var serialNumber: String?
    @NSManaged public var type: Data?
    @NSManaged public var uid: UUID?
    @NSManaged public var room: RoomEntity?

}

extension CounterEntity : Identifiable {

}

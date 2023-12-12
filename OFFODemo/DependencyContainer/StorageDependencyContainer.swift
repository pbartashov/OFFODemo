//
//  StorageDependencyContainer.swift
//  OFFODemo
//
//  Created by Павел Барташов on 09.11.2023.
//

import Foundation
import CoreDataStorage

protocol StorageDependencyContainerProtocol {
    associatedtype RoomStorageType: DomainModelRepositoryProtocol where RoomStorageType.DomainModelType == Room

//    func makeRoomStorage() -> RoomStorageType
}


struct StorageDependencyContainer {
   
    // MARK: - Properties

//    private let contextProvider: CoreDataContextProvider

    // MARK: - LifeCicle

    init(_ storageType: StorageType = .persistent) {
//        guard let bundle = Bundle(identifier: "pB.OFFODemo") else {
//            fatalError("Failed to load Core Data model")
//        }

//        self.contextProvider = CoreDataContextProvider(
//            bundle: bundle,
//            managedObjectModelFileName: "OFFODemo",
//            persistentContainerName: "OFFODemo",
//            storageType: storageType
//        )
    }
    
    // MARK: - Metods


}

extension StorageDependencyContainer: StorageDependencyContainerProtocol {

    typealias RoomStorageType = DomainModelRepository<CoreDataRepository<RoomEntity>>

//    func makeRoomStorage() -> RoomStorageType {
//        let repository = CoreDataRepository<RoomEntity>(managedObjectContext: contextProvider.backgroundContext)
//        return DomainModelRepository(repository: repository)
//    }
}

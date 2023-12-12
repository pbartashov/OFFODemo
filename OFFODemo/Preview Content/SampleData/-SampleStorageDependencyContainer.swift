//
//  SampleStorageDependencyContainer.swift
//  OFFODemo
//
//  Created by Павел Барташов on 09.11.2023.
//

//import Foundation
//import CoreDataStorage
//
//struct SampleStorageDependencyContainer {
//
//    // MARK: - Properties
//
//    private let contextProvider: CoreDataContextProvider
//
//    // MARK: - LifeCicle
//
//    init() {
//        guard let bundle = Bundle(identifier: "pB.OFFODemo") else {
//            fatalError("Failed to load Core Data model")
//        }
//
//        self.contextProvider = CoreDataContextProvider(
//            bundle: bundle,
//            managedObjectModelFileName: "OFFODemo",
//            persistentContainerName: "OFFODemo"
//        )
//    }
//
//    // MARK: - Metods
//
//
//}
//
//extension SampleStorageDependencyContainer: StorageDependencyContainerProtocol {
//
//    typealias RoomStorageType = DomainModelRepository<CoreDataRepository<RoomEntity>>
//
//    func makeRoomStorage() -> RoomStorageType {
//        let repository = CoreDataRepository<RoomEntity>(managedObjectContext: contextProvider.backgroundContext)
//        return DomainModelRepository(repository: repository)
//    }
//}

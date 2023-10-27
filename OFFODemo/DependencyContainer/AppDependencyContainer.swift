//
//  AppDependencyContainer.swift
//  PosterUIKit
//
//  Created by Павел Барташов on 08.11.2022.
//

import Foundation
import Combine
import CoreDataStorage

protocol AppDependencyContainerProtocol: AnyObject {
    associatedtype CoordinatorType: AppCoordinatorProtocol
    associatedtype RoomsAndCountersListViewModelType: RoomsAndCountersListViewModelProtocol

    func makeAppCoordinatorView() -> CoordinatorType
    func makeRoomsAndCountersListViewModel() -> RoomsAndCountersListViewModelType



}

final class AppDependencyContainer: AppDependencyContainerProtocol {

    // MARK: - Properties

    private var appCoordinatorObject: AppCoordinatorObject!
    private let contextProvider: CoreDataContextProvider


    // MARK: - LifeCicle

    init() {
        guard let bundle = Bundle(identifier: "pB.OFFODemo") else {
            fatalError("Failed to load Core Data model")
        }
        
        self.contextProvider = CoreDataContextProvider(
            bundle: bundle,
            managedObjectModelFileName: "OFFODemo",
            persistentContainerName: "OFFODemo"
        )
    }

    // MARK: - Metods

    func makeAppCoordinatorView() -> some AppCoordinatorProtocol {
        let appCoordinatorObject = AppCoordinatorObject(dependencyContainer: self)
        self.appCoordinatorObject = appCoordinatorObject

        return AppCoordinatorView(object: appCoordinatorObject)
    }

    @MainActor 
    func makeRoomsAndCountersListViewModel() -> some RoomsAndCountersListViewModelProtocol {
        let repository = CoreDataRepository<RoomEntity>(managedObjectContext: contextProvider.backgroundContext)
        let storage = DomainModelRepository(repository: repository)

        return RoomsAndCountersListViewModel(
            coordinator: appCoordinatorObject,
            storage: storage,
            makeRoomViewModel: makeRoomListViewModel(for:)
        )
    }

    private func makeRoomListViewModel(for room: Room) -> RoomListViewModel {
        RoomListViewModel(room: room, makeCounterViewModel: makeCounterViewModel(for:))
    }

    private func makeCounterViewModel(for counter: Counter) -> CounterListViewModel {
        CounterListViewModel(counter: counter)
    }
}




extension AppDependencyContainer: ObservableObject {

}

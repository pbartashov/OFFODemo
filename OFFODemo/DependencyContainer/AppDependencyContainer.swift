//
//  AppDependencyContainer.swift
//  PosterUIKit
//
//  Created by Павел Барташов on 08.11.2022.
//

import Foundation
import Combine

protocol AppDependencyContainerProtocol: AnyObject {
//    associatedtype AppCoordinatorViewType: AppCoordinatorViewProtocol
//    associatedtype RoomsAndCountersListViewModelType: RoomsAndCountersListViewModelProtocol

//    func makeAppCoordinatorView() -> AppCoordinatorViewType
//    func makeRoomsAndCountersListViewModel(appCoordinatorObject: AppCoordinatorObject<Self>) -> RoomsAndCountersListViewModelType
    func makeRoomsAndCountersListViewModel(appCoordinatorObject: AppCoordinatorObject) -> any RoomsAndCountersListViewModeling
//    func makeRoomsAndCountersListViewModel(appCoordinatorObject: AppCoordinatorObject<Self>) -> RoomsAndCountersListViewModelType
    func makeCounterDetailedViewModel(for: Counter) -> CounterDetailedViewModel
}

final class AppDependencyContainer: AppDependencyContainerProtocol {
//    func makeRoomsAndCountersListViewModel(appCoordinatorObject: AppCoordinatorObject<RoomsAndCountersListViewModel>) -> RoomsAndCountersListViewModel {
//        <#code#>
//    }
//    
//    typealias RoomsAndCountersListViewModelType = RoomsAndCountersListViewModel

//where T: StorageDependencyContainerProtocol {

//    typealias StorageDependencyContainerType = T

    // MARK: - Properties

//    private var appCoordinatorObject: AppCoordinatorObject<AppDependencyContainer>!
//    private var storageDependencyContainer: StorageDependencyContainerType


    // MARK: - LifeCicle

    init() {}
//    init(storageDependencyContainer: StorageDependencyContainerType = StorageDependencyContainer()) {
//        self.storageDependencyContainer = storageDependencyContainer
//    }

    // MARK: - Metods

    @MainActor
    func makeAppCoordinatorView() -> some AppCoordinatorViewProtocol {
        let appCoordinatorObject = AppCoordinatorObject(dependencyContainer: self)
        let appCoordinatorView = AppCoordinatorView(coordinatorObject: appCoordinatorObject)
//        let appCoordinatorView = AppCoordinatorView(coordinatorObject: AppCoordinatorObject2())
//        self.appCoordinatorObject = appCoordinatorObject
//
        return appCoordinatorView
//        return TestCoordinator()
    }

//    func makeAppCoordinatorView<T, U>() -> AppCoordinatorView<T, U> {
//        let appCoordinatorObject = AppCoordinatorObject<U>(dependencyContainer: self)
//                let appCoordinatorView = AppCoordinatorView<T,U>(coordinatorObject: appCoordinatorObject)
////        let appCoordinatorView = AppCoordinatorView(coordinatorObject: AppCoordinatorObject())
//        //        self.appCoordinatorObject = appCoordinatorObject
//        //
//        return appCoordinatorView
//        //        return TestCoordinator()
//    }
    

    @MainActor 
    func makeRoomsAndCountersListViewModel(
        appCoordinatorObject: AppCoordinatorObject<AppDependencyContainer>
    ) -> RoomsAndCountersListViewModel {

//        let storage = storageDependencyContainer.makeRoomStorage()

        return RoomsAndCountersListViewModel(
            coordinator: appCoordinatorObject,
//            storage: storage,
            makeRoomViewModel: makeRoomListViewModel(for:)
        )
    }

    private func makeRoomListViewModel(for room: Room) -> RoomListViewModel {
        RoomListViewModel(room: room, makeCounterViewModel: makeCounterViewModel(for:))
    }

    private func makeCounterViewModel(for counter: Counter) -> CounterListViewModel {
        CounterListViewModel(counter: counter)
    }

    @MainActor
    func makeCounterDetailedViewModel(for counter: Counter) -> CounterDetailedViewModel {
        CounterDetailedViewModel(counter: counter)
    }
}




extension AppDependencyContainer: ObservableObject {

}

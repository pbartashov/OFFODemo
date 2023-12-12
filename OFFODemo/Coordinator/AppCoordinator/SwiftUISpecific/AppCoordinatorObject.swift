//
//  AppCoordinatorObject.swift
//  OFFODemo
//
//  Created by Павел Барташов on 26.10.2023.
//

import Foundation


//protocol Coordinator {
//    func open<T>(_: T)
//}




protocol AppCoordinatorProtocol: AnyObject {
    func openDetails(for: Counter)
}

final class AppCoordinatorObject: ObservableObject
//final class AppCoordinatorObject<T>: ObservableObject
//final class AppCoordinatorObject<T, U>: ObservableObject
//where T: AppDependencyContainerProtocol//, T.RoomsAndCountersListViewModelType == U {
{
    private unowned var dependencyContainer: any AppDependencyContainerProtocol

    @Published var roomsAndCountersListViewModel: (any RoomsAndCountersListViewModeling)!
//    @Published var roomsAndCountersListViewModel: any RoomsAndCountersListViewModeling
//    @Published var roomsAndCountersListViewModel: T.RoomsAndCountersListViewModelType!
//    @Published var roomsAndCountersListViewModel: RoomsAndCountersListViewModel<AppCoordinatorObject>!
//    @Published var counterDetailedViewModel: CounterDetailedViewModel?

    var unwrappedVM: any RoomsAndCountersListViewModeling {
        roomsAndCountersListViewModel
    }

    init(dependencyContainer: some AppDependencyContainerProtocol) {
        self.dependencyContainer = dependencyContainer
        self.roomsAndCountersListViewModel = dependencyContainer.makeRoomsAndCountersListViewModel(appCoordinatorObject: self)
    }
    
//    func open(_ item: ListItem) {
//        self.detailViewModel = DetailViewModel(item: item, coordinator: self)
//    }
}

extension AppCoordinatorObject: AppCoordinatorProtocol {
    func openDetails(for counter: Counter) {
//        counterDetailedViewModel = dependencyContainer.makeCounterDetailedViewModel(for: counter)
    }
}




final class AppCoordinatorObject2: ObservableObject, AppCoordinatorProtocol {
    func openDetails(for: Counter) {

    }


//    @Published var roomsAndCountersListViewModel: RoomsAndCountersListViewModel<AppCoordinatorObject2>!
    @Published var roomsAndCountersListViewModel: RoomsAndCountersListViewModel!

    @Published var counterDetailedViewModel: CounterDetailedViewModel?

    init() { }

    //    func open(_ item: ListItem) {
    //        self.detailViewModel = DetailViewModel(item: item, coordinator: self)
    //    }
}

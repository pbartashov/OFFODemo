//
//  RoomsAndCountersListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 12.09.2023.
//

import Combine

@MainActor
protocol RoomsAndCountersListViewModeling: ObservableObject {
//    var roomsPublisher: AnyPublisher<[any RoomViewModelProtocol], Never> { get }
    var roomVMs: [RoomListViewModel] { get }

    func open(_: CounterListViewModel)
}

@MainActor
final class RoomsAndCountersListViewModel: RoomsAndCountersListViewModeling
//where T: DomainModelRepositoryProtocol, T.DomainModelType == Room
//      where U: AppCoordinatorProtocol
{
//    typealias StorageType = T
//    typealias CoordinatorType = U

    // MARK: - Properties
    private unowned var coordinator: AppCoordinatorProtocol
//    private let storage: StorageType

    @Published var roomVMs: [RoomListViewModel] = []

//    @Published var roomVMs: [RoomListViewModel: CounterListViewModel] = []
//    var roomsPublisher: Published<[any RoomViewModelProtocol]>.Publisher { $rooms }

//    private let makeRoomViewModel: (Room) -> RoomViewModel


    // MARK: - LifeCicle

    init(
        coordinator: AppCoordinatorProtocol,
//        storage: StorageType,
        makeRoomViewModel: @escaping (Room) -> RoomListViewModel
    ) {
        self.coordinator = coordinator
//        self.storage = storage
//
//        storage
//            .domainModelsPublisher
//            .map { rooms in
//                rooms.compactMap { makeRoomViewModel($0) }
//            }
//            .assign(to: &$roomVMs)
    }

    // MARK: - Metods

    func open(_ counterListViewModel: CounterListViewModel) {

//        let counter = storage.getDomainModels(predicate: <#T##NSPredicate?#>)
        let counter = Counter.counterSampleBath1
//        return CounterDetailedViewModel(counter: counter)
        coordinator.openDetails(for: counter)
    }
}


//extension Publisher where Self.Failure == Never {
//    public func assignNoRetain<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable where Root: AnyObject {
//        sink { [weak object] (value) in
//            object?[keyPath: keyPath] = value
//        }
//    }
//}

//
//  RoomsAndCountersListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 12.09.2023.
//

import Combine

@MainActor
protocol RoomsAndCountersListViewModelProtocol: ObservableObject {
//    var roomsPublisher: AnyPublisher<[any RoomViewModelProtocol], Never> { get }
    var roomVMs: [RoomListViewModel] { get }
}

@MainActor
final class RoomsAndCountersListViewModel<T, U>: ObservableObject, RoomsAndCountersListViewModelProtocol
where T: DomainModelRepositoryProtocol, T.DomainModelType == Room,
      U: AppCoordinatorObjectProtocol
{
    // MARK: - Properties
    private let coordinator: U
    private let storage: T

    @Published var roomVMs: [RoomListViewModel] = []

//    @Published var roomVMs: [RoomListViewModel: CounterListViewModel] = []
//    var roomsPublisher: Published<[any RoomViewModelProtocol]>.Publisher { $rooms }

//    private let makeRoomViewModel: (Room) -> RoomViewModel


    // MARK: - LifeCicle

    init(
        coordinator: U,
        storage: T,
        makeRoomViewModel: @escaping (Room) -> RoomListViewModel
    ) {
        self.coordinator = coordinator
        self.storage = storage

        storage
            .domainModelsPublisher
            .map { rooms in
                rooms.compactMap { makeRoomViewModel($0) }
            }
            .assign(to: &$roomVMs)
    }

    // MARK: - Metods




}


//extension Publisher where Self.Failure == Never {
//    public func assignNoRetain<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable where Root: AnyObject {
//        sink { [weak object] (value) in
//            object?[keyPath: keyPath] = value
//        }
//    }
//}

//
//  RoomsAndCountersListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 12.09.2023.
//

import Combine

@MainActor
protocol CounterListViewModelProtocol: ObservableObject {
//    var roomsPublisher: AnyPublisher<[any RoomViewModelProtocol], Never> { get }
    var roomVMs: [RoomListViewModel] { get }
}

@MainActor
final class RoomsAndCountersListViewModel<T: DomainModelRepositoryProtocol>: ObservableObject,
                                                                    CounterListViewModelProtocol where T.DomainModelType == Room {
    // MARK: - Properties

    @Published var roomVMs: [RoomListViewModel] = []

//    @Published var roomVMs: [RoomListViewModel: CounterListViewModel] = []
//    var roomsPublisher: Published<[any RoomViewModelProtocol]>.Publisher { $rooms }
    private let storage: T
//    private let makeRoomViewModel: (Room) -> RoomViewModel


    // MARK: - LifeCicle

    internal init(
        storage: T,
        makeRoomViewModel: @escaping (Room) -> RoomListViewModel
    ) {
        self.storage = storage
//        self.makeRoomViewModel = makeRoomViewModel

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

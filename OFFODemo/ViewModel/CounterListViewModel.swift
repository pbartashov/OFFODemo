//
//  CounterListViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 12.09.2023.
//

import Combine

protocol CounterListViewModelProtocol: ObservableObject {
    var roomsPublisher: Published<[Room]>.Publisher { get }
    var rooms: [Room] { get }
}

final class CounterListViewModel: ObservableObject, CounterListViewModelProtocol {

    // MARK: - Properties

    @Published var rooms: [Room] = []
    var roomsPublisher: Published<[Room]>.Publisher { $rooms }
    private let storage: CounterStorageProtocol


    // MARK: - LifeCicle

    internal init(storage: CounterStorageProtocol) {
        self.storage = storage

    }
    // MARK: - Metods




}


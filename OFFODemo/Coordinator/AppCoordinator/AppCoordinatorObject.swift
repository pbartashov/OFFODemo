//
//  AppCoordinatorObject.swift
//  OFFODemo
//
//  Created by Павел Барташов on 26.10.2023.
//

import Foundation

protocol AppCoordinatorObjectProtocol: ObservableObject {

}

final class AppCoordinatorObject: AppCoordinatorObjectProtocol {

    private unowned var dependencyContainer: any AppDependencyContainerProtocol
    @Published var listViewModel: (any RoomsAndCountersListViewModelProtocol)!
//    @Published var detailViewModel: DetailViewModel?
    
    init(dependencyContainer: any AppDependencyContainerProtocol) {
        self.dependencyContainer = dependencyContainer
        self.listViewModel = dependencyContainer.makeRoomsAndCountersListViewModel()
    }
    
//    func open(_ item: ListItem) {
//        self.detailViewModel = DetailViewModel(item: item, coordinator: self)
//    }
}

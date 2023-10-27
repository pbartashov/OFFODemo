//
//  ContentView.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CounterList(viewModel: RoomsAndCountersListViewModel(coordinator: AppCoordinatorObjectSample(), storage: RoomStorageSample(), makeRoomViewModel: ViewModelMakerSample.makeRoomViewModel(_:)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

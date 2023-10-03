//
//  CounterList.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import SwiftUI

struct CounterList<T: CounterListViewModelProtocol>: View {

    typealias ViewModelType = T
    @StateObject var viewModel: ViewModelType

//    @EnvironmentObject var modelData: ModelData

    @State private var selectedCounter: Counter?

    var body: some View {
        NavigationView {
            List(selection: $selectedCounter) {
                ForEach(viewModel.roomVMs) { roomVM in
                    Section {
                        Text(roomVM.name)
                        ForEach(roomVM.counters) { counterVM in
                            NavigationLink {
                                //                        LandmarkDetail(landmark: counter)
                                Text("Details")
                            } label: {
                                //                        LandmarkRow(landmark: counter)
                                Text(counterVM.serialNumber)
                            }
                        }
                    }




//                    .tag(counter)
                }
            }
            .navigationTitle("title")
            .frame(minWidth: 300)
//            .toolbar {
//                ToolbarItem {
//                    Menu {
//                        Picker("Category", selection: $filter) {
//                            ForEach(FilterCategory.allCases) { category in
//                                Text(category.rawValue).tag(category)
//                            }
//                        }
//                        .pickerStyle(.inline)
//
//                        Toggle(isOn: $showFavoritesOnly) {
//                            Label("Favorites only", systemImage: "star.fill")
//                        }
//                    } label: {
//                        Label("Filter", systemImage: "slider.horizontal.3")
//                    }
//                }
//            }

            Text("Select a counter".localized)
        }


//        .focusedValue(\.selectedCounter, $modelData.landmarks[index ?? 0])
    }
}

struct CounterList_Previews: PreviewProvider {
    static var previews: some View {
        CounterList(
            viewModel: RoomsAndCountersListViewModel(
                storage: RoomStorageSample(),
                makeRoomViewModel: ViewModelMakerSample.makeRoomViewModel(_:))
        )
    }
}

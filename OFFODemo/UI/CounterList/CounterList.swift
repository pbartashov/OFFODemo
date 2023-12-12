//
//  CounterList.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import SwiftUI

struct CounterList<ViewModel>: View
where ViewModel: RoomsAndCountersListViewModeling {
//<T: RoomsAndCountersListViewModelProtocol&ObservableObject>: View {
//struct CounterList: View {
//    typealias ViewModelType = T
//    @Binding var viewModel: ViewModelType


    @ObservedObject var viewModel: ViewModel

//    @EnvironmentObject var modelData: ModelData

    @State private var selectedCounter: Counter?

//    init(viewModel: some RoomsAndCountersListViewModeling, selectedCounter: Counter? = nil) {
////        self.viewModel = viewModel
////        self.selectedCounter = selectedCounter
//        self.init(viewModel)
//    }
//
//    init(_ viewModel: ViewModel) {
//        self.viewModel = viewModel
//    }

    var body: some View {

//        List(
//            $viewModel.roomVMs,
//            editActions: [.delete, .move],
//            selection: $selectedCounter
//        ) { $roomVM in

        List(selection: $selectedCounter) {
            ForEach(viewModel.roomVMs) { roomVM in
                Section {
                    Text(roomVM.name)
                    ForEach(roomVM.counters) { counterVM in
                        CounterListRow(counterVM: counterVM)
                            .onNavigation {
                                viewModel.open(counterVM)
                            }

//                        NavigationLink {
//                            //                        LandmarkDetail(landmark: counter)
//                            Text("Details")
//                        } label: {
//                            //                        LandmarkRow(landmark: counter)
//                            CounterListRow(counterVM: counterVM)
//
//                        }
                    }
                }




                //                    .tag(counter)
            }
        }
        .navigationTitle("title")
        .frame(minWidth: 300)
        .listStyle(.plain)
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

            Text("Select a counter")
        


//        .focusedValue(\.selectedCounter, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    Text("bhbj125")
//    CounterList(
//        viewModel: RoomsAndCountersListViewModel(
//            coordinator: AppCoordinatorObjectSample(),
//            storage: RoomStorageSample(),
//            makeRoomViewModel: ViewModelMakerSample.makeRoomViewModel(_:))
//    )
}

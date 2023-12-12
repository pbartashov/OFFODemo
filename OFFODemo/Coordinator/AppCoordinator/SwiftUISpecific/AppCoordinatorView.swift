//
//  AppCoordinatorView.swift
//  OFFODemo
//
//  Created by Павел Барташов on 26.10.2023.
//

import SwiftUI

//protocol AppCoordinatorProtocol {
//    func open<T>(_: T)
//}


protocol AppCoordinatorViewProtocol: View {
//    func open<T>(_: T)
}



extension View {
    func onNavigation(_ action: @escaping () -> Void) -> some View {
        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )
        
        return NavigationLink(
            destination: EmptyView(),
            isActive: isActive
        ) {
            self
        }
    }

    func navigationDestination<Item, Destination: View>(
        for binding: Binding<Item?>,
        @ViewBuilder destination: @escaping (Binding<Item>) -> Destination
    ) -> some View {

        let isActive = Binding(
            get: { binding.wrappedValue != nil },
            set: { value in
                if !value {
                    binding.wrappedValue = nil
                }
            }
        )

        return self.background(NavigationLink(isActive: isActive) {
            if let unwrapped = Binding(binding) {
                destination(unwrapped)
            } else {
                EmptyView()	
            }
        } label: {
            EmptyView()
        })
    }
}

//struct AppCoordinatorView<T>: AppCoordinatorProtocol
//where T: AppCoordinatorObjectProtocol {
//
//    @ObservedObject var object: T
//
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//extension AppCoordinatorObject {
//    typealias T = T // to expose T to be visible from outside
//}

struct AppCoordinatorView: AppCoordinatorViewProtocol {
//struct AppCoordinatorView<T, U>: AppCoordinatorViewProtocol
//where T: AppCoordinatorObject<U>
//where T == AppCoordinatorObject<U>
//where T == AppCoordinatorObject<T>.T
//{

//struct AppCoordinatorView<T>: AppCoordinatorViewProtocol
//where T: AppDependencyContainerProtocol {

//    let coordinatorObject: AppCoordinatorObject<T>
    @StateObject private var coordinatorObject: AppCoordinatorObject
//    @ObservedObject private var coordinatorObject: AppCoordinatorObject<T>

//    var vm: any RoomsAndCountersListViewModeling

    init(coordinatorObject: AppCoordinatorObject) {
        // SwiftUI ensures that the following initialization uses the
        // closure only once during the lifetime of the view, so
        // later changes to the view's name input have no effect.
        _coordinatorObject = StateObject(wrappedValue: coordinatorObject)
    }

    var body: some View {
//        Text("Hello")
//        if let price = pricing.price {
//            Text(price.amount).bold() + Text(" \(price.description)").font(.system(size: 12))
//        } else {
//            Text("Price not available")
//                .italic()
//                .foregroundColor(.gray)
//        }
//        makeView(vm)
        anyView(coordinatorObject.unwrappedVM)
        NavigationView {
            makeView(coordinatorObject.unwrappedVM)
//            CounterList(viewModel: coordinatorObject.roomsAndCountersListViewModel)
        }
//        .navigationDestination(for: $coordinatorObject.counterDetailedViewModel) { detailViewModel in
//            CounterDetail(counterVM: detailViewModel)
//        }
    }
}

func makeView<T>(_ vm: some RoomsAndCountersListViewModeling) -> CounterList<T> {
    CounterList(viewModel: vm)
}

func anyView(_ vm: some RoomsAndCountersListViewModeling) -> AnyView {
    AnyView(
        CounterList(viewModel: vm)
    )

}




//extension AppCoordinatorView: AppCoordinatorProtocol {
//    func open<U>(_: U) {
//        let counter = Counter.counterSampleBath1
//        detailViewModel = dependencyContainer.makeCounterDetailedViewModel(for: counter)
//    }
//}



#Preview {
//    AppCoordinatorView(coordinatorObject: AppCoordinatorObject2())
    Container()
}




#if DEBUG
fileprivate struct Container: View {
    let appDependencyContainer = AppDependencyContainer(
//        storageDependencyContainer: StorageDependencyContainer(.inMemory)
    )

    var body: some View {
//        AppCoordinatorView(coordinatorObject: AppCoordinatorObject2())
        appDependencyContainer.makeAppCoordinatorView()
    }
}
#endif



#warning("classes to structs if no published")


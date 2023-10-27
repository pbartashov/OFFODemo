//
//  AppCoordinatorView.swift
//  OFFODemo
//
//  Created by Павел Барташов on 26.10.2023.
//

import SwiftUI


protocol AppCoordinatorProtocol: View { }

struct AppCoordinatorView<T>: AppCoordinatorProtocol
where T: AppCoordinatorObjectProtocol {

    @ObservedObject var object: T

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AppDependencyContainer().makeAppCoordinatorView()
}


#warning("classes to structs if no published")
#warning("no objects for coordibators")

//
//  OFFODemoApp.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import SwiftUI

@main
struct OFFODemoApp: App {

    @StateObject private var dependencyContainer = AppDependencyContainer()

    var body: some Scene {
        WindowGroup {
            dependencyContainer.makeAppCoordinatorView()
        }
    }
}

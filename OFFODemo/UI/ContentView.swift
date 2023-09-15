//
//  ContentView.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       CounterList(viewModel: CounterListViewModel(storage: CounterStorage()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

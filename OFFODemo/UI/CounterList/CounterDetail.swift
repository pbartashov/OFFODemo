//
//  CounterDetail.swift
//  OFFODemo
//
//  Created by Павел Барташов on 04.10.2023.
//

import SwiftUI

struct CounterDetail: View {

    @Binding var counterVM: CounterDetailedViewModel

    //The better route is to have a separate variable to control the animations
    // This prevents unpleasant side-effects.
    @State private var showAccountLabel = false

    var body: some View {
        Form {
            Section(header: Text("CounterInfo")) {
                Picker("Type", selection: $counterVM.type) {
                    ForEach(counterVM.selectableTypes) { type in
                        Text(localized: type.shortTitle)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                VStack(alignment: .leading) {
                    if !counterVM.serialNumber.isEmpty {
                        Text("SerialNumber")
                    }
                    TextField("SerialNumber", text: $counterVM.serialNumber.animation(.easeOut))
//                    TextField("SerialNumber", text: $counterVM.serialNumber.animation(.interactiveSpring))
                 }
                VStack(alignment: .leading) {
                    if showAccountLabel {
                        Text("Account")
                   }

                    TextField("Account", text: $counterVM.account)
                        .onSubmit {
                            withAnimation(.easeOut(duration: 3)) {
                                showAccountLabel = !counterVM.account.isEmpty
                            }
                        }
                }
             }
        }
    }
}

#Preview {
    Container()
        .environment(\.locale, .init(identifier: "ru"))
}

#if DEBUG
fileprivate struct Container: View {
    @State private var counterVM = CounterDetailedViewModel.emptyCounterVM

    var body: some View {
        CounterDetail(counterVM: $counterVM)
    }
}
#endif

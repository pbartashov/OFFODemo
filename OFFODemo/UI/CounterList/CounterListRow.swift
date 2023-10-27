//
//  CounterListRow.swift
//  OFFODemo
//
//  Created by Павел Барташов on 02.10.2023.
//

import SwiftUI

struct CounterListRow: View {
    var counterVM: CounterListViewModel
    var body: some View {
        HStack {
            Text(counterVM.typeAsEmoji)
            Text(localized: counterVM.typeTitle)
            Spacer()
            Text(counterVM.serialNumber)
        }
    }
}


#Preview {
    CounterListRow(
        counterVM: CounterListViewModel(
            counter: Counter.counterSampleBath1
        )
    )
    .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    CounterListRow(
        counterVM: CounterListViewModel(
            counter: Counter.counterSampleBath1
        )
    )
    .environment(\.locale, .init(identifier: "en"))
}

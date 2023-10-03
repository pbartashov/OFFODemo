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
            Text(counterVM.type.asEmoji)
            Text(counterVM.type.title)
            Text(counterVM.serialNumber)
        }
    }
}

extension CounterType {
    var asEmoji: String {
        switch self {
            case .unknown:
                "?"
            case .coldWater:
                "❄"
            case .hotWater:
                "♨"
            case .electric:
                "⌁"
            case .heat:
                "☀"
                //            case .gas:
                //                "☁"
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

//
//  AddablePicker.swift
//  OFFODemo
//
//  Created by Павел Барташов on 23.10.2023.
//

import SwiftUI

struct AddablePicker<T>: View
where T: Hashable,
      T: Identifiable,
      T: Titled {

    let title: LocalizedStringKey
    let items: [T]
   @Binding var selection: T
    let addItem: (() -> T)?

    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: true) {
                Picker(title, selection: $selection) {
                    ForEach(items) { item in
                        Text(localized: item.title)
                            .tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .fixedSize()

            }
//            Spacer()
            Button("New", systemImage: "plus.circle") {
                if let newRoom = addItem?() {
                    selection = newRoom
                }
            }
            .labelStyle(.iconOnly)

        }

    }
}

#Preview {
    Container()
}

#if DEBUG
fileprivate struct Container: View {
    @State private var selection = Room.sampleData[0]
    @State private var items = Room.sampleData

    var body: some View {
        AddablePicker(
            title: "Rooms",
            items: items,
            selection: $selection,
            addItem: {
                let newRoom = Room(name: "New")
                items.append(newRoom)
                return newRoom
            }
        )
    }
}

extension Room: Titled {
    var title: String {
        name
    }
}
#endif

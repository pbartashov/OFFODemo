//
//  Text+.swift
//  OFFODemo
//
//  Created by Павел Барташов on 03.10.2023.
//

import SwiftUI

extension Text {
    init(localized string: String) {
        self.init(LocalizedStringKey(string))
    }
}

extension TextField {
    func a(localized string: String, text: Binding<String>, prompt: Text?) {
//        let a: TextField = .init(LocalizedStringKey(string), text: text, prompt: prompt)

//        self.init(LocalizedStringKey(string), text: text, prompt: prompt)
    }
}

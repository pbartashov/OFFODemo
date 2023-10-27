//
//  View+.swift
//  OFFODemoTests
//
//  Created by Павел Барташов on 04.10.2023.
//

import SwiftUI
import XCTest
import ViewInspector

extension View {
    func setInputForTextField(
        labeled label: String,
        with value: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let block = {
            try self
                .inspect()
                .find(ViewType.TextField.self) { view in
                    let textFieldLabel = try view
                        .labelView()
                        .text()
                        .string()
                    return textFieldLabel == label
                }
                .setInput(value)
        }

        XCTAssertNoThrow(try block(), file: file, line: line)
    }

    func tapButton(
        labeled label: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertNoThrow(
            try findButton(labeled: label).tap(),
            file: file,
            line: line
        )
    }

    func findButton(labeled label: String) throws -> InspectableView<ViewType.Button> {
        try self
            .inspect()
            .find(button: label)
    }
}

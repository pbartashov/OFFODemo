//
//  CounterDetailViewTests.swift
//  OFFODemoTests
//
//  Created by Павел Барташов on 04.10.2023.
//

import XCTest
@testable import OFFODemo
import ViewInspector
import SwiftUI

final class CounterDetailViewTests: XCTestCase {

    var sut: CounterDetail!
    var counterVMBinding = Binding(wrappedValue: CounterDetailedViewModel.emptyCounterVM)

    override func setUpWithError() throws {
       sut = CounterDetail(counterVM: counterVMBinding)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_serialNumberInput_shouldSetValueInViewModel() throws {
        let expected = "dummy title"
        sut.setInputForTextField(labeled: "SerialNumber", with: expected)
        let input = counterVMBinding.serialNumber.wrappedValue

        XCTAssertEqual(input, expected)
    }

    func test_accountInput_shouldSetValueInViewModel() throws {
        let expected = "dummy title"
        sut.setInputForTextField(labeled: "Account", with: expected)
        let input = counterVMBinding.account.wrappedValue

        XCTAssertEqual(input, expected)
    }

    func test_typeInput_shouldSetValueInViewModel() throws {
        let expected = CounterType.hotWater

        try sut
            .inspect()
            .find(ViewType.Picker.self)
            .select(value: CounterType.hotWater)

        let input = counterVMBinding.type.wrappedValue

        XCTAssertEqual(input, expected)
    }



//    self.type = type
//    self.roomID = roomID
//    self.account = account
//    self.isTwoTariff = isTwoTariff

//    func test_whenWithoutDate_ShouldNotShowDateInput() throws {
//        XCTAssertThrowsError(
//            try sut
//                .inspect()
//                .find(ViewType.DatePicker.self)
//        )
//    }
//
//    func test_whenWithDate_shouldAllowDateInput() throws {
//        let expected = Date(timeIntervalSinceNow: 1_000_000)
//
//        try sut.inspect().find(ViewType.Toggle.self).tap()
//
//        try sut
//            .inspect()
//            .find(ViewType.DatePicker.self)
//            .select(date: expected)
//        let input = toDoItemData.date
//
//        XCTAssertEqual(input, expected)
//    }
//
//    func test_shouldAllowDescriptionInput() throws {
//        let expected = "dummy description"
//        sut.setInputForTextField(labeled: "Description", with: expected)
//        let input = toDoItemData.itemDescription
//
//        XCTAssertEqual(input, expected)
//    }
//
//    func test_shouldAllowLocationInput() throws {
//        let expected = "dummy location"
//        sut.setInputForTextField(labeled: "Location name", with: expected)
//        let input = toDoItemData.locationName
//
//        XCTAssertEqual(input, expected)
//    }
//
//    func test_shouldAllowAddressInput() throws {
//        let expected = "dummy address"
//        sut.setInputForTextField(labeled: "Address", with: expected)
//        let input = toDoItemData.addressString
//
//        XCTAssertEqual(input, expected)
//    }
//
//    func test_shouldHaveASaveButton() throws {
//        XCTAssertNoThrow(
//            try sut.findButton(labeled: "Save")
//        )
//    }
//
//    func test_saveButton_shouldFetchCoordinate() throws {
//        toDoItemData.title = "dummy title"
//        let expected = "dummy address"
//        toDoItemData.addressString = expected
//
//        sut.tapButton(labeled: "Save")
//
//        XCTAssertEqual(apiClientMock.coordinateAddress, expected)
//    }
//
//    func test_save_whenAddressIsEmpty_shouldNotFetchCoordinate() throws {
//        toDoItemData.title = "dummy title"
//        sut.tapButton(labeled: "Save")
//
//        XCTAssertNil(apiClientMock.coordinateAddress)
//    }
//
//    func test_save_shouldCallDelegate() throws {
//        let title = "dummy title"
//        let coordinate = Coordinate(latitude: 1, longitude: 2)
//        toDoItemData.title = title
//        toDoItemData.addressString = "dummy address"
//        apiClientMock.coordinateReturnValue = coordinate
//
//        let delegateMock = ToDoItemInputViewDelegateMock()
//        sut.delegate = delegateMock
//
//        sut.tapButton(labeled: "Save")
//
//        XCTAssertEqual(delegateMock.lastToDoItemData?.title, title)
//        XCTAssertEqual(delegateMock.lastCoordinate, coordinate)
//    }
//
//    func test_whenAddressIsEmpty_shouldCallDelegate() throws {
//        let title = "dummy title"
//        let coordinate = Coordinate(latitude: 1, longitude: 2)
//        toDoItemData.title = title
//        apiClientMock.coordinateReturnValue = coordinate
//
//        let delegateMock = ToDoItemInputViewDelegateMock()
//        sut.delegate = delegateMock
//
//        sut.tapButton(labeled: "Save")
//
//        XCTAssertEqual(delegateMock.lastToDoItemData?.title, title)
//    }
//
//    func test_whenCantFindCoordinateToAddress_shouldNotCallDelegate() throws {
//        let title = "dummy title"
//        toDoItemData.title = title
//        toDoItemData.addressString = "dummy address"
//        apiClientMock.coordinateReturnValue = nil
//
//        let delegateMock = ToDoItemInputViewDelegateMock()
//        sut.delegate = delegateMock
//
//        sut.tapButton(labeled: "Save")
//
//        XCTAssertNil(delegateMock.lastToDoItemData?.title)
//        XCTAssertNil(delegateMock.lastCoordinate)
//    }
//
//    func test_whenCantFindCoordinateToAddress_shouldShowAlert() throws {
//        try doAlertTest() { view, _ in
//            let actualView = try view.actualView()
//            actualView.tapButton(labeled: "Save")
//
//            let alert = try actualView.inspect().form().alert()
//            XCTAssertEqual(try alert.title().string(), "Can't find coordinate to address.")
//            XCTAssertEqual(try alert.message().text().string(), "Would you like to save item yet?")
//            let yesButton = try alert.actions().find(button: "Yes")
//            XCTAssertEqual(try yesButton.role(), nil)
//
//            let noButton = try alert.actions().find(button: "No")
//            XCTAssertEqual(try noButton.role(), .cancel)
//        }
//    }
//
//    func test_whenTapYesButtonOnAlert_shouldCallDelegate() throws {
//        try doAlertTest() { view, delegate in
//            let actualView = try view.actualView()
//            actualView.tapButton(labeled: "Save")
//            actualView.tapButton(labeled: "Yes")
//
//            XCTAssertEqual(delegate.lastToDoItemData?.title, "dummy title")
//        }
//    }
//
//    func test_whenTapNoButtonOnAlert_shouldDissmissAlert() throws {
//        try doAlertTest() { view, delegate in
//            let actualView = try view.actualView()
//            actualView.tapButton(labeled: "Save")
//            actualView.tapButton(labeled: "No")
//
//            XCTAssertThrowsError(try actualView.inspect().form().alert())
//        }
//    }
//
//    func doAlertTest(
//        closure: @escaping (InspectableView<ViewType.View<ToDoItemInputView>>, ToDoItemInputViewDelegateMock) throws -> Void,
//        file: StaticString = #filePath,
//        line: UInt = #line
//    ) throws {
//        let title = "dummy title"
//        toDoItemData.title = title
//        toDoItemData.addressString = "dummy address"
//        apiClientMock.coordinateReturnValue = nil
//
//        let delegateMock = ToDoItemInputViewDelegateMock()
//        sut.delegate = delegateMock
//
//        let exp = sut.on(\.didAppear) { view in
//            XCTAssertNoThrow(
//                try closure(view, delegateMock),
//                file: file,
//                line: line
//            )
//        }
//
//        ViewHosting.host(view: sut)
//        wait(for: [exp], timeout: 0.1)
//    }
}

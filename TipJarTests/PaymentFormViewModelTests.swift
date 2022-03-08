//
//  PaymentFormViewModelTests.swift
//  TipJarTests
//
//  Created by Jackie Ramos on 3/8/22.
//

import XCTest
@testable import TipJar

class PaymentFormViewModelTests: XCTestCase {

    private let viewModel: PaymentFormViewModel = PaymentFormViewModel()

    func testTotalTipAmountIsCorrect() {
        XCTAssertEqual(viewModel.totalTipAmount, NSDecimalNumber(decimal: 10.0))
    }

    func testCannotDecreaseNumberOfPerson() {
        viewModel.numberOfPersons = 1
        XCTAssertFalse(viewModel.canDecreaseNumberOfPerson)
    }

    func testCanDecreaseNumberOfPerson() {
        viewModel.numberOfPersons = 2
        XCTAssertTrue(viewModel.canDecreaseNumberOfPerson)
    }

    func testFormattedAmountInStringIsEmpty() {
        viewModel.amountInString = ""
        XCTAssertTrue(viewModel.formattedAmountInString.isEmpty)
    }

    func testFormattedAmountInStringIsNotEmpty() {
        viewModel.amountInString = "2,000.00"
        XCTAssertFalse(viewModel.formattedAmountInString.isEmpty)
        XCTAssertEqual(viewModel.formattedAmountInString, viewModel.amountInString.toDecimal.toCurrencyString(showSymbol: false))
    }

    func testTotalTipAmountInStringIsNotEmpty() {
        XCTAssertEqual(viewModel.totalTipAmountInString, viewModel.totalTipAmount.toCurrencyString())
    }

    func testTipPerPersonInString() {
        let tipPerPerson = viewModel.totalTipAmount.dividing(by: NSDecimalNumber(value: viewModel.numberOfPersons))
        XCTAssertEqual(viewModel.tipPerPersonInString, tipPerPerson.toCurrencyString())
    }

    func testSaveImageSuccess() {
        viewModel.image = UIImage(named: "tipJarLogo")
        XCTAssertNotNil(AppFileManager.getImage(AppFileManager.fileName))
    }

    func testSaveImageFailure() {
        viewModel.image = UIImage(named: "")
        XCTAssertNil(AppFileManager.getImage(AppFileManager.fileName))
    }
}

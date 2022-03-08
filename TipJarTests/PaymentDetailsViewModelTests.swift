//
//  PaymentDetailsViewModelTests.swift
//  TipJarTests
//
//  Created by Jackie Ramos on 3/8/22.
//

import XCTest
@testable import TipJar

class PaymentDetailsViewModelTests: XCTestCase {

    private var viewModel: PaymentDetailsViewModel!

    override func setUp() {
        viewModel = PaymentDetailsViewModel(payment: Payment(context: CoreDataManager.shared.container.viewContext, amount: NSDecimalNumber(decimal: 200.0), numberOfPerson: 2, imageFileName: "sample"))
    }

    func testSaveDateIsNotEmpty() {
        XCTAssertFalse(viewModel.savedDate.isEmpty)
        XCTAssertEqual(viewModel.savedDate, viewModel.payment?.savedDate.default)
    }

    func testSaveDateIsEmpty() {
        viewModel.payment = nil
        XCTAssertTrue(viewModel.savedDate.isEmpty)
        XCTAssertEqual(viewModel.savedDate, "")
    }

    func testImageFileNameIsNotEmpty() {
        XCTAssertFalse(viewModel.imageFileName.isEmpty)
        XCTAssertEqual(viewModel.imageFileName, viewModel.payment?.imageFileName)
    }

    func testImageFileNameIsEmpty() {
        viewModel.payment = nil
        XCTAssertTrue(viewModel.imageFileName.isEmpty)
        XCTAssertEqual(viewModel.imageFileName, "")
    }

    func testAmountIsNotEmpty() {
        XCTAssertFalse(viewModel.amount.isEmpty)
        XCTAssertEqual(viewModel.amount, viewModel.payment?.amount.toCurrencyString())
    }

    func testAmountIsEmpty() {
        viewModel.payment = nil
        XCTAssertTrue(viewModel.amount.isEmpty)
        XCTAssertEqual(viewModel.amount, "")
    }

    func testTipAmountIsNotEmpty() {
        XCTAssertFalse(viewModel.tipAmount.isEmpty)
        XCTAssertEqual(viewModel.tipAmount, "Tip: \(viewModel.payment?.totalTipAmount.toCurrencyString() ?? "")" )
    }

    func testTipAmountIsEmpty() {
        viewModel.payment = nil
        XCTAssertEqual(viewModel.tipAmount, "Tip: " )
    }
}

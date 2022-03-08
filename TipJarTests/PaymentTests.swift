//
//  PaymentTests.swift
//  TipJarTests
//
//  Created by Jackie Ramos on 3/8/22.
//

import XCTest
@testable import TipJar

class PaymentTests: XCTestCase {

    private var payment: Payment!

    override func setUp() {
        payment = Payment(context: CoreDataManager.shared.container.viewContext, amount: NSDecimalNumber(decimal: 100), numberOfPerson: 2, imageFileName: "")
    }

    func testTipPercentageIsCorrect() {
        XCTAssertEqual(10.0/100.0, 0.10)
    }

    func testPaymentAmoutIsNotNil() {
        payment.amount = NSDecimalNumber(decimal: 100)
        XCTAssertNotNil(payment.amount)
    }

    func testPaymentAmoutIsNil() {
        payment = Payment(context: CoreDataManager.shared.container.viewContext, amount: nil, numberOfPerson: Int(2.0), imageFileName: "")

        XCTAssertEqual(payment.amount, NSDecimalNumber(decimal: 0.0))
    }

    func testTotalTipAmountIsNotNil() throws {
        payment.amount = NSDecimalNumber(decimal: 100)
        XCTAssertNotNil(payment.totalTipAmount)
    }

    func testTotalTipAmountIsNil() {
        payment = Payment(context: CoreDataManager.shared.container.viewContext, amount: nil, numberOfPerson: Int(2.0), imageFileName: "")

        XCTAssertEqual(payment.totalTipAmount, NSDecimalNumber(value: 0.0))
    }
}

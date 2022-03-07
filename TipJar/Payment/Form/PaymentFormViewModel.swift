//
//  PaymentFormViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Foundation
import CoreData

class PaymentFormViewModel: ObservableObject {
    @Published var amount: NSDecimalNumber
    @Published var numberOfPersons: Int = 1
    @Published var amountInString: String = "" {
        didSet {
            amount = amountInString.isEmpty ? defaultValue : amountInString.toDecimal
        }
    }
    @Published var isKeyboardVisible: Bool = false
    @Published var showErrorAlert: Bool = false

    private let defaultValue: NSDecimalNumber = NSDecimalNumber(decimal: 100.00)
    private let tipPercentage: NSDecimalNumber = NSDecimalNumber(decimal: 10.0/100.0)
    let placeHolder: String

    var totalTipAmount: NSDecimalNumber {
        amount.multiplying(by: tipPercentage)
    }

    var canDecreaseNumberOfPerson: Bool {
        numberOfPersons > 1
    }

    var formattedAmountInString: String {
        amountInString.isEmpty ? "" : amountInString.toDecimal.toCurrencyString(showSymbol: false)
    }

    var totalTipAmountInString: String {
        totalTipAmount.toCurrencyString()
    }

    var tipPerPersonInString: String {
        let tipPerPerson = totalTipAmount.dividing(by: NSDecimalNumber(value: numberOfPersons))
        return tipPerPerson.toCurrencyString()
    }

    init() {
        amount = defaultValue
        placeHolder = defaultValue.toCurrencyString(showSymbol: false)
    }

    func saveTip(_ context: NSManagedObjectContext) {
        let _ = Tip(context: CoreDataManager.shared.container.viewContext, amount: amount, numberOfPerson: numberOfPersons, imageDirectory: "")
        do {
            try context.save()
        } catch {
            showErrorAlert = true
        }
    }
}

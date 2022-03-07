//
//  PaymentFormViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Foundation

class PaymentFormViewModel: ObservableObject {
    @Published var tip: Tip
    @Published var amountInString: String = "" {
        didSet {
            tip.amount = amountInString.isEmpty ? defaultValue : amountInString.toDecimal
        }
    }
    @Published var isKeyboardVisible: Bool = false

    private let defaultValue: Decimal = 100.00
    let placeHolder: String

    var canDecreaseNumberOfPerson: Bool {
        tip.numberOfPerson > 1
    }

    var formattedAmountInString: String {
        amountInString.isEmpty ? "" : amountInString.toDecimal.toCurrencyString(showSymbol: false)
    }

    init() {
        tip = Tip(amount: defaultValue, numberOfPerson: 1, tipPercentage: 10)
        placeHolder = defaultValue.toCurrencyString(showSymbol: false)
    }
}

//
//  Tip.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import Foundation

struct Tip {
    var amount: Decimal
    var numberOfPerson: Int
    var tipPercentage: Decimal

    var tipInDecimal: Decimal {
        tipPercentage/100.0
    }

    var tipPerPerson: Decimal {
        totalTipAmount / Decimal(numberOfPerson)
    }

    var totalTipAmount: Decimal {
        amount * tipInDecimal
    }
}

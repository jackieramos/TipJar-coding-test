//
//  Decimal+Formatting.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import Foundation

public extension NSDecimalNumber {
    static var currencySymbol: String = {
        let formatter: NumberFormatter = .currency
        return formatter.currencySymbol ?? ""
    }()

    func toCurrencyString(showSymbol: Bool = true) -> String {
        let formatter: NumberFormatter = .currency
        var value: Decimal = self.decimalValue
        var rounded: Decimal = Decimal()
        NSDecimalRound(&rounded, &value, 2, .plain)

        var stringValue: String = ""

        if showSymbol {
            stringValue = formatter.currencySymbol + (formatter.string(for: rounded) ?? "0.00")
        } else {
            stringValue = formatter.string(for: rounded) ?? "0.00"
        }

        return stringValue
    }
}

public extension String {
    var toDecimal: NSDecimalNumber {
        let formatter: NumberFormatter = .currency
        let amount = formatter.number(from: self)?.decimalValue ?? Decimal(0.0)
        return NSDecimalNumber(decimal: amount)
    }
}

extension NumberFormatter {
    static let currency: NumberFormatter = {
        let currentLocale = Locale.current

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = currentLocale
        formatter.currencyCode = currentLocale.currencyCode
        formatter.currencyCode = currentLocale.currencySymbol
        formatter.numberStyle = .decimal
        return formatter
    }()
}

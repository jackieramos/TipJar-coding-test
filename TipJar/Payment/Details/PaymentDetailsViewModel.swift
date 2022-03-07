//
//  PaymentDetailsViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import UIKit

class PaymentDetailsViewModel: ObservableObject {
    let payment: Payment?

    var savedDate: String {
        payment?.savedDate.default ?? ""
    }

    var imageFileName: String {
        payment?.imageFileName ?? ""
    }

    var amount: String {
        payment?.amount.toCurrencyString() ?? ""
    }

    var tipAmount: String {
        "Tip: \(payment?.totalTipAmount.toCurrencyString() ?? "")" 
    }

    init(payment: Payment? = nil) {
        self.payment = payment
    }

    func getImage(_ fileName: String) -> UIImage {
        AppFileManager.getImage(fileName) ?? (UIImage(named: "tipJarLogo") ?? UIImage())
    }
}

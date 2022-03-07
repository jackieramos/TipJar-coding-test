//
//  PaymentDetailsViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import UIKit

class PaymentDetailsViewModel: ObservableObject {
    let tip: Tip?

    var savedDate: String {
        tip?.savedDate.default ?? ""
    }

    var imageFileName: String {
        tip?.imageFileName ?? ""
    }

    var amount: String {
        tip?.amount.toCurrencyString() ?? ""
    }

    var tipAmount: String {
        "Tip: \(tip?.totalTipAmount.toCurrencyString() ?? "")" 
    }

    init(tip: Tip? = nil) {
        self.tip = tip
    }

    func getImage(_ fileName: String) -> UIImage {
        AppFileManager.getImage(fileName) ?? (UIImage(named: "tipJarLogo") ?? UIImage())
    }
}

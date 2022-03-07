//
//  PaymentFormViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class PaymentFormViewModel: ObservableObject {
    @Published var amount: NSDecimalNumber
    @Published var numberOfPersons: Int = 1
    @Published var amountInString: String = "" {
        didSet {
            amount = amountInString.isEmpty ? defaultValue : amountInString.toDecimal
        }
    }
    @Published var image: UIImage?
    @Published var isKeyboardVisible: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var showHistory: Bool = false

    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
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

        $image.sink { [weak self] image in
            guard let image = image else { return }
            let imageUuid = UUID().uuidString
            AppFileManager.saveImage(imageUuid, image: image) { error in
                if error != nil {
                    self?.showErrorAlert = true
                }
            }
            self?.saveTip(CoreDataManager.shared.container.viewContext, imageFileName: AppFileManager.fileName)
            self?.showHistory = true
        }
        .store(in: &bag)
    }

    func saveTip(_ context: NSManagedObjectContext, imageFileName: String = "") {
        let _ = Payment(context: context, amount: amount, numberOfPerson: numberOfPersons, imageFileName: imageFileName)
        do {
            try context.save()
        } catch {
            showErrorAlert = true
        }
    }
}

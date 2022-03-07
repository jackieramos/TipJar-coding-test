//
//  Tip.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import CoreData

@objc(Tip)
class Tip: NSManagedObject, Identifiable {
    @NSManaged var id: UUID
    @NSManaged var savedDate: Date
    @NSManaged var amount: NSDecimalNumber
    @NSManaged var totalTipAmount: NSDecimalNumber
    @NSManaged var imageFileName: String

    private let tipPercentage: NSDecimalNumber = NSDecimalNumber(decimal: 10.0/100.0)

    convenience init(context: NSManagedObjectContext, amount: NSDecimalNumber?, numberOfPerson: Int, imageFileName: String) {
        self.init(context: context)
        self.id = UUID()
        self.savedDate = Date()
        self.amount = amount ?? NSDecimalNumber(value: 0.0)
        self.totalTipAmount = amount?.multiplying(by: tipPercentage) ?? NSDecimalNumber(value: 0.0)
        self.imageFileName = imageFileName
    }
}

//
//  CoreDataManager.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/7/22.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    var container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: K.appName)

        container.loadPersistentStores { storeDescription, error in
            self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }
}

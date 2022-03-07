//
//  TipJarApp.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

@main
struct TipJarApp: App {
    var body: some Scene {
        WindowGroup {
            PaymentFormView()
                .environment(\.managedObjectContext, CoreDataManager.shared.container.viewContext)
        }
    }
}

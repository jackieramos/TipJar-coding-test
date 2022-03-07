//
//  PaymentsHistoryViewModel.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Combine
import SwiftUI

class PaymentsHistoryViewModel: ObservableObject {
    func getImage(_ fileName: String) -> UIImage {
        AppFileManager.getImage(fileName) ?? (UIImage(named: "tipJarLogo") ?? UIImage())
    }
}

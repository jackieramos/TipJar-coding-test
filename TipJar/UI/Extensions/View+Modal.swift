//
//  View+Modal.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Foundation
import SwiftUI

extension View {
    func modal<Content: View>(isShowing: Binding<Bool>, _ content: @escaping () -> Content) -> some View {
        ZStack {
            self
            ModalView(isShowing: isShowing, content: content)
        }
    }
}

//
//  Views+ViewModifiers.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import Foundation
import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

struct CustomNavigationBarBackButton: ViewModifier {

    @Binding var isShowing: Bool

    @ViewBuilder
    private var backButton: some View {
        Button {
            isShowing = false
        } label: {
            Image("back", bundle: .main)
        }
    }

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }

    func customBackButton(isShowing: Binding<Bool>) -> some View {
        modifier(CustomNavigationBarBackButton(isShowing: isShowing))
    }
}

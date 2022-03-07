//
//  TextField+ViewModifiers.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import SwiftUI

struct ExtraLargeBoldTextFieldSize: ViewModifier {
    var textColor: Color? = .black

    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 42.0))
    }
}

extension TextField {
    func extraLargeBoldTextFieldSize(_ textColor: Color? = .black) -> some View {
        modifier(ExtraLargeBoldTextFieldSize(textColor: textColor))
    }
}

//
//  Text+ViewModifiers.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import SwiftUI

struct DefaultBoldTextSize: ViewModifier {
    var textColor: Color? = .black

    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 16.0))
    }
}

struct LargeBoldTextSize: ViewModifier {
    var textColor: Color? = .black

    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 24.0))
    }
}

struct ExtraLargeBoldTextSize: ViewModifier {
    var textColor: Color? = .black

    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 42.0))
    }
}

extension Text {
    func defaultBoldTextSize(_ textColor: Color? = .black) -> some View {
        modifier(DefaultBoldTextSize(textColor: textColor))
    }

    func largeBoldTextSize(_ textColor: Color? = .black) -> some View {
        modifier(LargeBoldTextSize(textColor: textColor))
    }

    func extraLargeBoldTextSize(_ textColor: Color? = .black) -> some View {
        modifier(ExtraLargeBoldTextSize(textColor: textColor))
    }
}

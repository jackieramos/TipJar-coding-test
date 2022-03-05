//
//  PanelView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

public struct PanelView<Content: View>: View {
    private let content: Content
    private let cornerRadius: CGFloat = 12.0

    /// A simple panel with rounded corners, usually used with a 1px solid border
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: .zero) {
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .cornerRadius(cornerRadius)
        .drawingGroup()
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color("cbcbcb", bundle: .main), lineWidth: 1)
        )
    }
}

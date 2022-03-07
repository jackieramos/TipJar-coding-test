//
//  KeyboardAccessoryView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/6/22.
//

import SwiftUI
import Combine

public protocol KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> { get }
}

public extension KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },

            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
            .eraseToAnyPublisher()
    }
}

public struct KeyboardAccessoryView: View {

    private let title: String
    private let onCompletion: (() -> Void)?

    public init(title: String, onCompletion: (() -> Void)? = nil) {
        self.title = title
        self.onCompletion = onCompletion
    }

    public var body: some View {
        HStack {
            Spacer()
            Button(title) {
                hideKeyboard()
                onCompletion?()
            }
            .padding(.trailing, .spacing16)
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity,
               idealHeight: 44.0, maxHeight: 44.0,
               alignment: .center)
    }
}

public extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

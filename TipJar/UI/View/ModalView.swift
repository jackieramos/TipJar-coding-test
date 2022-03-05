//
//  ModalView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import SwiftUI

struct ModalView<Content: View>: View {
    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        ZStack {
            if isShowing {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .opacity(0.6)
                    .onTapGesture {
                        isShowing = false
                    }

                content()
            }
        }
        .animation(.default, value: isShowing)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isShowing: .constant(true)) { EmptyView() }
    }
}

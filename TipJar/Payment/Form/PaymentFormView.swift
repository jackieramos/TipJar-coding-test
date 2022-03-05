//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct PaymentFormView: View {

    @State private var showHistory: Bool = false

    @ViewBuilder
    private var header: some View {
        HStack(spacing: .zero) {
            Spacer()

            Image("tipJarLogo", bundle: .main)

            Spacer()

            NavigationLink(isActive: $showHistory) {
                PaymentsHistoryView(isShowing: $showHistory)
            } label: {
                Image("history", bundle: .main)
            }
        }
    }

    @ViewBuilder
    private var enterAmount: some View {
        VStack(alignment: .leading, spacing: .spacing16) {
            Text("Enter amount")
                .defaultBoldTextSize()
            PanelView {
                HStack(spacing: .zero) {
                    Text("$")
                        .largeBoldTextSize()
                    Spacer()
                    Text("200.00")
                        .extraLargeBoldTextSize()
                    Spacer()
                }
                .padding(.horizontal, .spacing21)
                .padding(.vertical, .spacing16)
            }
        }
    }

    @ViewBuilder
    private var numberOfPeople: some View {
        VStack(alignment: .leading, spacing: .spacing16) {
            Text("How many people?")
                .defaultBoldTextSize()

            HStack(spacing: .zero) {
                Button {
                    print("Pressed")
                } label: {
                    Image("plus", bundle: .main)
                }
                .buttonStyle(CircularButtonStyle(size: 71.0))

                Spacer()

                Text("2")
                    .extraLargeBoldTextSize()

                Spacer()

                Button {
                    
                } label: {
                    Image("minus", bundle: .main)
                }
                .buttonStyle(CircularButtonStyle(size: 71.0))
            }
        }
    }

    @ViewBuilder
    private var tip: some View {
        VStack(alignment: .leading, spacing: .spacing16) {
            Text("% TIP")
                .defaultBoldTextSize()
            PanelView {
                HStack(spacing: .zero) {
                    Spacer()
                    Text("200.00")
                        .extraLargeBoldTextSize()
                    Spacer()
                    Text("%")
                        .largeBoldTextSize()
                }
                .padding(.horizontal, .spacing21)
                .padding(.vertical, .spacing16)
            }
        }
    }

    @ViewBuilder
    private var summary: some View {
        VStack(spacing: .spacing16) {
            HStack(spacing: .zero) {
                Text("Total Tip")
                    .defaultBoldTextSize()
                Spacer()
                Text("$20.00")
                    .defaultBoldTextSize()
            }

            HStack(spacing: .zero) {
                Text("Per Person")
                    .largeBoldTextSize()
                Spacer()
                Text("$10.00")
                    .largeBoldTextSize()
            }
        }
    }

    @ViewBuilder
    private var footer: some View {
        VStack(alignment: .leading, spacing: .spacing28) {
            HStack(spacing: .spacing13) {
                Button {
                    
                } label: {
                    Image("checkSelected", bundle: .main)
                }
                .buttonStyle(CheckboxButtonStyle())

                Text("Take photo of receipt")
                    .defaultBoldTextSize()
            }

            Button("Save payment") {
                
            }
            .buttonStyle(CallToActionGradientButtonStyle())
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: .spacing32) {
                    header
                    enterAmount
                    numberOfPeople
                    tip
                    summary
                    footer
                }
                .padding(.spacing24)
            }
            .hiddenNavigationBarStyle()
        }
    }
}

struct PaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFormView()
    }
}

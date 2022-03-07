//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct PaymentFormView: View, KeyboardReadable {
    @StateObject private var viewModel: PaymentFormViewModel = PaymentFormViewModel()
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
                HStack(spacing: .spacing16) {
                    Text(Decimal.currencySymbol)
                        .largeBoldTextSize()
                    TextField(viewModel.placeHolder, text: $viewModel.amountInString)
                        .extraLargeBoldTextFieldSize()
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
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
                    viewModel.tip.numberOfPerson += 1
                } label: {
                    Image("plus", bundle: .main)
                }
                .buttonStyle(CircularButtonStyle(size: 71.0))

                Spacer()

                Text("\(viewModel.tip.numberOfPerson)")
                    .extraLargeBoldTextSize()

                Spacer()

                Button {
                    if viewModel.canDecreaseNumberOfPerson {
                        viewModel.tip.numberOfPerson -= 1
                    }
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
                HStack(spacing: .spacing16) {
                    Spacer()
                    Text("10")
                        .extraLargeBoldTextSize()
                        .frame(maxWidth: .infinity, alignment: .center)
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
                Text(viewModel.tip.totalTipAmount.toCurrencyString())
                    .defaultBoldTextSize()
            }

            HStack(spacing: .zero) {
                Text("Per Person")
                    .largeBoldTextSize()
                Spacer()
                Text(viewModel.tip.tipPerPerson.toCurrencyString())
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

    @ViewBuilder
    private var keyboardAccessory: some View {
        if viewModel.isKeyboardVisible {
            VStack(spacing: .zero) {
                KeyboardAccessoryView(title: "Done") {
                    viewModel.amountInString = viewModel.formattedAmountInString
                }
            }
            .animation(.default, value: viewModel.isKeyboardVisible)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
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
                keyboardAccessory
            }
            .hiddenNavigationBarStyle()
            .onReceive(keyboardPublisher) { value in
                viewModel.isKeyboardVisible = value
            }
        }
    }
}

struct PaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFormView()
    }
}

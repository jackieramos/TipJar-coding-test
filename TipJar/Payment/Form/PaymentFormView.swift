//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct PaymentFormView: View, KeyboardReadable {
    @Environment(\.managedObjectContext) var context
    @StateObject private var viewModel: PaymentFormViewModel = PaymentFormViewModel()
    @State private var showCameraView: Bool = false
    @State private var checkboxState: Bool = false

    @ViewBuilder
    private var header: some View {
        HStack(spacing: .zero) {
            Spacer()

            Image("tipJarLogo")

            Spacer()

            NavigationLink(isActive: $viewModel.showHistory) {
                PaymentsHistoryView(isShowing: $viewModel.showHistory)
            } label: {
                Image("history")
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
                    Text(NSDecimalNumber.currencySymbol)
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
                    viewModel.numberOfPersons += 1
                } label: {
                    Image("plus", bundle: .main)
                }
                .buttonStyle(CircularButtonStyle(size: 71.0))

                Spacer()

                Text("\(viewModel.numberOfPersons)")
                    .extraLargeBoldTextSize()

                Spacer()

                Button {
                    if viewModel.canDecreaseNumberOfPerson {
                        viewModel.numberOfPersons -= 1
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
                Text(viewModel.totalTipAmountInString)
                    .defaultBoldTextSize()
            }

            HStack(spacing: .zero) {
                Text("Per Person")
                    .largeBoldTextSize()
                Spacer()
                Text(viewModel.tipPerPersonInString)
                    .largeBoldTextSize()
            }
        }
    }

    @ViewBuilder
    private var footer: some View {
        VStack(alignment: .leading, spacing: .spacing28) {
            HStack(spacing: .spacing13) {
                Button {
                    checkboxState.toggle()
                } label: {
                    Image(checkboxState ? "checkSelected" : "checkUnselected", bundle: .main)
                }
                .buttonStyle(CheckboxButtonStyle(isSelected: checkboxState))

                Text("Take photo of receipt")
                    .defaultBoldTextSize()
            }

            Button("Save payment") {
                if checkboxState {
                    showCameraView = true
                } else {
                    viewModel.saveTip(context)
                    viewModel.showHistory = true
                }
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

    @ViewBuilder
    private var cameraView: some View {
        CameraView(isShowing: $showCameraView, selectedImage: $viewModel.image)
    }

    private var errorAlert: Alert {
        Alert(title: Text("Something went wrong"), message: Text("Data can't be saved"))
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
            .alert(isPresented: $viewModel.showErrorAlert) { errorAlert }
            .sheet(isPresented: $showCameraView) { cameraView }
        }
    }
}

struct PaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFormView()
    }
}

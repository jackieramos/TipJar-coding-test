//
//  PaymentsHistoryView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

struct PaymentsHistoryView: View {
    @StateObject private var viewModel: PaymentsHistoryViewModel = PaymentsHistoryViewModel()

    @FetchRequest(sortDescriptors: [SortDescriptor(\.savedDate, order: .reverse)])
    var payments: FetchedResults<Payment>

    @Binding var isShowing: Bool
    @State private var showDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: .spacing38) {
                ForEach(payments) { payment in
                    Button {
                        viewModel.selectedPayment = payment
                        showDetails = true
                    } label: {
                        paymentItem(date: payment.savedDate.default,
                                    amount: payment.amount,
                                    totalTip: "Tip: \(payment.totalTipAmount.toCurrencyString())",
                                    imageFileName: payment.imageFileName)
                    }
                }
            }
            .padding(.spacing24)
        }
        .navigationBarTitle("SAVED PAYMENTS", displayMode: .inline)
        .customBackButton(isShowing: $isShowing)
        .modal(isShowing: $showDetails) {
            PaymentDetailsView(viewModel: PaymentDetailsViewModel(payment: viewModel.selectedPayment))
        }
    }

    @ViewBuilder
    private func paymentItem(date: String,
                             amount: NSDecimalNumber,
                             totalTip: String,
                             imageFileName: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: .spacing12) {
                Text(date)
                    .defaultBoldTextSize()
                HStack(spacing: .spacing21) {
                    Text(amount.toCurrencyString())
                        .largeBoldTextSize()
                    Text(totalTip)
                        .defaultBoldTextSize(Color("7d7d7d"))
                }
            }

            Spacer()

            Image(uiImage: viewModel.getImage(imageFileName))
                .resizable()
                .scaledToFill()
                .frame(width: 53.0, height: 53.0)
                .cornerRadius(.radius12)
        }
    }
}

struct PaymentsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsHistoryView(isShowing: .constant(true))
    }
}

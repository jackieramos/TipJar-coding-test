//
//  PaymentsHistoryView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

struct PaymentsHistoryView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.savedDate, order: .reverse)])
    var tips: FetchedResults<Tip>

    @Binding var isShowing: Bool
    @State private var showDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 38.0) {
                ForEach(tips) { tip in
                    Button {
                        showDetails = true
                    } label: {
                        paymentItem(date: tip.savedDate.default, amount: tip.amount, totalTip: "Tip: \(tip.totalTipAmount.toCurrencyString())")
                    }
                }
            }
        }
        .padding(.spacing24)
        .navigationBarTitle("SAVED PAYMENTS", displayMode: .inline)
        .customBackButton(isShowing: $isShowing)
        .modal(isShowing: $showDetails) {
            PaymentDetailsView()
        }
    }

    @ViewBuilder
    private func paymentItem(date: String, amount: NSDecimalNumber, totalTip: String) -> some View {
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

            Image("tipJarLogo", bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: 53.0, height: 53.0)
                .cornerRadius(12)
        }
    }
}

struct PaymentsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsHistoryView(isShowing: .constant(true))
    }
}

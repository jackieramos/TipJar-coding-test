//
//  PaymentsHistoryView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

struct PaymentsHistoryView: View {

    @Binding var isShowing: Bool
    @State private var showDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 38.0) {
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                    .onTapGesture {
                        showDetails = true
                    }
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
                paymentItem(date: "2021 January 21", amount: "$205.23", totalTip: "Tip: $20.52")
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
    private func paymentItem(date: String, amount: String, totalTip: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: .spacing12) {
                Text(date)
                    .defaultBoldTextSize()
                HStack(spacing: 22) {
                    Text(amount)
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

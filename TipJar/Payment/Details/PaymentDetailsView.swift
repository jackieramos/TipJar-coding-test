//
//  PaymentDetailsView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

struct PaymentDetailsView: View {

    @StateObject var viewModel: PaymentDetailsViewModel

    var body: some View {
        VStack(spacing: .spacing13) {
            Image(uiImage: viewModel.getImage(viewModel.imageFileName))
                .resizable()
                .scaledToFit()
                .frame(height: 399)
                .background(.white)
                .cornerRadius(.radius12)
            
            VStack(alignment: .leading, spacing: .spacing12) {
                Text(viewModel.savedDate)
                    .defaultBoldTextSize()
                HStack {
                    Text(viewModel.amount)
                        .largeBoldTextSize()
                    Spacer()
                    Text(viewModel.tipAmount)
                        .defaultBoldTextSize(Color("7d7d7d"))
                }
            }
            .padding(.spacing16)
            .background(.white)
            .cornerRadius(.radius12)
        }
        .padding(.horizontal, .spacing38)
    }
}

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailsView(viewModel: PaymentDetailsViewModel())
    }
}

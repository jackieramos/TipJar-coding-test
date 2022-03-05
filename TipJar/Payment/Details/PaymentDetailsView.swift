//
//  PaymentDetailsView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/4/22.
//

import SwiftUI

struct PaymentDetailsView: View {
    var body: some View {
        VStack(spacing: 13) {
            Image("tipJarLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 399)
                .background(.white)
                .cornerRadius(.radius12)
            
            VStack(alignment: .leading, spacing: .spacing12) {
                Text("2021 January 21")
                    .defaultBoldTextSize()
                HStack {
                    Text("$205.23")
                        .largeBoldTextSize()
                    Spacer()
                    Text("Tip: $20.52")
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
        PaymentDetailsView()
    }
}

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
                .cornerRadius(12.0)
            
            VStack(alignment: .leading, spacing: 12.0) {
                Text("2021 January 21")
                    .font(.system(size: 16))
                HStack {
                    Text("$205.23")
                        .font(.system(size: 24))
                    Spacer()
                    Text("Tip: $20.52")
                        .font(.system(size: 16))
                        .foregroundColor(Color("7d7d7d", bundle: .main))
                }
            }
            .padding(16.0)
            .background(.white)
            .cornerRadius(12.0)
        }
        .padding(.horizontal, 38.0)
    }
}

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailsView()
    }
}

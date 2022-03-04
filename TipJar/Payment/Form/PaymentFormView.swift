//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct PaymentFormView: View {

    @ViewBuilder
    private var enterAmount: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Enter amount")
                .foregroundColor(.black)
            PanelView {
                HStack {
                    Text("$")
                        .font(.system(size: 24))
                    Spacer()
                    Text("200.00")
                        .font(.system(size: 42))
                    Spacer()
                }
                .padding(.horizontal, 21.0)
                .padding(.vertical, 17.0)
            }
        }
    }

    @ViewBuilder
    private var numberOfPeople: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Number of people")
                .foregroundColor(.black)

            HStack {
                VStack(spacing: .zero) {
                    Button {
                        
                    } label: {
                        Image("minus", bundle: .main)
                    }
                }
                .frame(width: 71, height: 71)
                .overlay(
                    Circle()
                        .stroke(Color("d2d2d2", bundle: .main), lineWidth: 1)
                )

                Spacer()

                Text("2")
                    .font(.system(size: 42))

                Spacer()

                VStack(spacing: .zero) {
                    Button {
                        
                    } label: {
                        Image("plus", bundle: .main)
                    }
                }
                .frame(width: 71, height: 71)
                .overlay(
                    Circle()
                        .stroke(Color("d2d2d2", bundle: .main), lineWidth: 1)
                )
            }
        }
    }

    @ViewBuilder
    private var tip: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("% TIP")
                .foregroundColor(.black)
            PanelView {
                HStack {
                    Spacer()
                    Text("200.00")
                        .font(.system(size: 42))
                    Spacer()
                    Text("%")
                        .font(.system(size: 24))
                }
                .padding(.horizontal, 21.0)
                .padding(.vertical, 17.0)
            }
        }
    }

    @ViewBuilder
    private var summary: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Total Tip")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Spacer()
                Text("$20.00")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }

            HStack {
                Text("Per Person")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                Spacer()
                Text("$10.00")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
        }
    }

    @ViewBuilder
    private var footer: some View {
        VStack(alignment: .leading, spacing: 28.0) {
            HStack(spacing: 13.0) {
                VStack(spacing: .zero) {
                    Button {
                        
                    } label: {
                        Image("checkSelected", bundle: .main)
                    }
                }
                .frame(width: 31, height: 31)
                .cornerRadius(7.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 7.0)
                        .stroke(Color("f1790a", bundle: .main), lineWidth: 1)
                )

                Text("Take photo of receipt")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }

            Button {
                
            } label: {
                Text("Save payment")
                    .padding(.vertical, 15.0)
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("f27a0a", bundle: .main), Color("d26e11", bundle: .main)]), startPoint: .top, endPoint: .bottom)
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 32.0) {
                HStack(spacing: .zero) {
                    Spacer()
                    Image("tipJarLogo", bundle: .main)
                    Spacer()
                    Image("history", bundle: .main)
                }

                enterAmount
                numberOfPeople
                tip
                summary
                footer
            }
            .padding(24)
        }
    }
}

struct PaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFormView()
    }
}

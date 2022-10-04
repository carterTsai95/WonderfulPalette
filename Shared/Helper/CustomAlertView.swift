//
//  CustomAlertView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-04.
//

import SwiftUI

struct CustomAlertView: View {
    var placeHolder: String
    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark")
                .font(.title)
            Text(placeHolder)
                .fontWeight(.medium)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(
            .ultraThinMaterial
        )
        .cornerRadius(15)
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    show.toggle()
                }
            }
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            CustomAlertView(
                placeHolder: "Test",
                show: .constant(true)
            )
        )
    }
}

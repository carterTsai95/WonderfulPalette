//
//  CustomAlertView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-04.
//

import SwiftUI

struct CustomAlertView: View {
    @EnvironmentObject var alertService: AlertsServiceBackend
    var alertModel: AlertModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark")
                .font(.title)
            Text(alertModel.title)
                .fontWeight(.medium)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(
            .ultraThinMaterial
        )
        .cornerRadius(15)
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            CustomAlertView(
                alertModel: .init(title: "Test Model")
            )
        )
    }
}

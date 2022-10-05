//
//  AlertsPresentationModifier.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//

import SwiftUI
import Combine

struct AlertsPresentationModifier: ViewModifier {
    @State var presentedAlert: AlertModel?
    @EnvironmentObject var alertService: AlertsServiceBackend

    func body(content: Content) -> some View {
        ZStack {
            content
                .onReceive(alertService.alertsQueueSignal.receive(on: DispatchQueue.main)) { alert in
                    presentedAlert = alert
                }
            alertView
        }
    }

    @ViewBuilder
    var alertView: some View {
        ZStack {
            if let presentedAlert = alertService.currentAlert {
                CustomAlertView(alertModel: presentedAlert)
                    .transition(alertService.transition)
            }
        }
        .animation(alertService.animation, value: presentedAlert)
    }
}

extension View {
    func alertsPresentation() -> some View {
        modifier(
            AlertsPresentationModifier()
        )
    }
}

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
            alertView
        }
    }

    @ViewBuilder
    var alertView: some View {
        ZStack {
            ForEach(alertService.currentAlerts, id: \.id) { alert in
                CustomAlertView(alertModel: alert)
                    .transition(alert.type.transition)
                    .onTapGesture {
                        if alert.isTapToDismiss {
                            alertService.removeAlert(alert)
                        }
                    }
            }
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

extension View {
    func alertsPresentation() -> some View {
        modifier(
            AlertsPresentationModifier()
        )
    }
}

extension View {
    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}

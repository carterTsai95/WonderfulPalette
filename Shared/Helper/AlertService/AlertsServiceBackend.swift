//
//  AlertsServiceBackend.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//
import Foundation
import SwiftUI
import Combine

class AlertsServiceBackend: AlertsService, ObservableObject {
    var alertSignal: PassthroughSubject<AlertModel, Never> = .init()
    @Published var currentAlerts: [AlertModel] = []
    private var alertTimer: Timer?
    private var cancellables: Set<AnyCancellable> = []
    let transition = AnyTransition.asymmetric(insertion: .scale, removal: .opacity).combined(with: .opacity)

    init() {
        alertSignal
            .receive(on: RunLoop.main)
            .sink { alertResult in
                withAnimation(.spring()) {
                    self.registeredAlert(alertResult)
                }
            }
            .store(in: &cancellables)
    }

    func presentAlert(alertModel: AlertModel) {
        DispatchQueue.global(qos: .utility).async {
            self.alertSignal.send(
                AlertModel(
                    title: alertModel.title,
                    type: alertModel.type,
                    autoDismiss: alertModel.autoDismiss,
                    isTapToDismiss: alertModel.isTapToDismiss,
                    isDragToDismiss: alertModel.isDragToDismiss,
                    description: alertModel.description
                )
            )
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        }
    }

    private func registeredAlert(_ alert: AlertModel) {
        self.currentAlerts.append(alert)
        if alert.autoDismiss {
            alertCountdown(alert)
        }
    }

    func alertCountdown(_ alert: AlertModel) {
        guard let index = currentAlerts.firstIndex(of: alert) else {
            return
        }

        currentAlerts[index].timer = Timer()
        currentAlerts[index].timer?.invalidate()
        currentAlerts[index].timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.removeAlert(alert)
        }
    }

    public func removeAlert(_ alert: AlertModel) {
        guard let index = currentAlerts.firstIndex(where: { $0.id == alert.id }) else {
            return
        }
        withAnimation(self.currentAlerts[index].animation) {
            currentAlerts[index].timer?.invalidate()
            currentAlerts[index].timer = nil
            print("Remove Alert: \(currentAlerts[index].title)")
            currentAlerts.remove(at: index)
        }
    }
}

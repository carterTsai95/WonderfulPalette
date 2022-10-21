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
    var alertsQueueSignal: PassthroughSubject<AlertModel, Never> = .init()
    @Published var currentAlert: AlertModel?
    private var alertTimer: Timer?
    private var cancellables: Set<AnyCancellable> = []
    let animation = Animation.easeInOut(duration: 0.1)
    let transition = AnyTransition.asymmetric(insertion: .scale, removal: .opacity).combined(with: .opacity)

    init() {
        alertsQueueSignal
            .receive(on: RunLoop.main)
            .sink { alertResult in
                self.currentAlert = alertResult
                self.alertCountdown()
            }
            .store(in: &cancellables)
    }

    func presentAlert(title: String) {
        DispatchQueue.global(qos: .utility).async {
            self.alertsQueueSignal.send(
                AlertModel(title: title)
            )
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        }
    }

    func alertCountdown() {
        self.alertTimer?.invalidate()
        alertTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation(self.animation) {
                self.currentAlert = nil
            }
            self.alertTimer?.invalidate()
            self.alertTimer = nil
        }
    }
}

//
//  AlertService.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//

import Foundation
import Combine

protocol AlertsService {
    var alertsQueueSignal: PassthroughSubject<AlertModel, Never> { get }
    func presentAlert(
        title: String
    )
}

//
//  AlertService.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//

import Foundation
import Combine

protocol AlertsService {
    var alertSignal: PassthroughSubject<AlertModel, Never> { get }
    func presentAlert(
        alertModel: AlertModel
    )
}

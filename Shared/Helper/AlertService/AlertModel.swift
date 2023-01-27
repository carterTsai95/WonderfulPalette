//
//  AlertModel.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//

import Foundation
import SwiftUI

public struct AlertModel: Equatable {
    public static func == (lhs: AlertModel, rhs: AlertModel) -> Bool {
        return lhs.id == rhs.id
    }

    let id: UUID = UUID()
    let type: AlertType = .toast
    let title: String
    let autoDismiss: Bool = false
    let isTapToDismiss: Bool = true
    let isDragToDismiss: Bool = true
    let countDownTimer: Int = 2
    let alertAnimationDuration: Double = 3
    var timer: Timer?
    var description: String?
    var alertAnimation: AlertAnimation = .fullpage(duration: 1)
    var alertTransition: AlertTransition = .toast
}

public extension AlertModel {
    enum AlertType {
        case modal
        case fullpage
        case toast
    }
    // Animation and Transition
    enum AlertTransition {
        case modal
        case fullpage
        case toast

        public var value: AnyTransition {
            switch self {
            case .modal:
                return AnyTransition.asymmetric(
                    insertion: .move(edge: .top),
                    removal: .move(edge: .top)
                ).combined(with: .opacity)
            case .fullpage:
                return AnyTransition.asymmetric(
                    insertion: .slide,
                    removal: .scale
                ).combined(with: .opacity)
            case .toast:
                return AnyTransition.asymmetric(
                    insertion: .move(edge: .bottom),
                    removal: .move(edge: .bottom)
                ).combined(with: .opacity)
            }
        }
    }

    enum AlertAnimation {
        case modal(duration: Double)
        case fullpage(duration: Double)
        case toast(duration: Double)

        public var value: Animation {
            switch self {
            case .modal(let duration):
                return Animation.easeInOut(duration: duration)
            case .fullpage(let duration):
                return Animation.easeInOut(duration: duration)
            case .toast(let duration):
                return Animation.linear(duration: duration)
            }
        }
    }
}

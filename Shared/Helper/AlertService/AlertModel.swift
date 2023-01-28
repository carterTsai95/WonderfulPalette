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
    let type: AlertType = .bottom
    let title: String
    let autoDismiss: Bool = false
    let isTapToDismiss: Bool = false
    let isDragToDismiss: Bool = true
    let countDownTimer: Int = 2
    let alertAnimationDuration: Double = 3
    var timer: Timer?
    var description: String?
    var alertAnimation: AlertAnimation = .center(duration: 1)
    var alertTransition: AlertTransition = .bottom
}

public extension AlertModel {
    enum AlertType {
        case top
        case center
        case bottom
    }
    // Animation and Transition
    enum AlertTransition {
        case top
        case center
        case bottom

        public var value: AnyTransition {
            switch self {
            case .top:
                return AnyTransition.asymmetric(
                    insertion: .move(edge: .top),
                    removal: .move(edge: .top)
                ).combined(with: .opacity)
            case .center:
                return AnyTransition.asymmetric(
                    insertion: .slide,
                    removal: .scale
                ).combined(with: .opacity)
            case .bottom:
                return AnyTransition.asymmetric(
                    insertion: .move(edge: .bottom),
                    removal: .move(edge: .bottom)
                ).combined(with: .opacity)
            }
        }
    }

    enum AlertAnimation {
        case top(duration: Double)
        case center(duration: Double)
        case bottom(duration: Double)

        public var value: Animation {
            switch self {
            case .top(let duration):
                return Animation.easeInOut(duration: duration)
            case .center(let duration):
                return Animation.easeInOut(duration: duration)
            case .bottom(let duration):
                return Animation.linear(duration: duration)
            }
        }
    }
}

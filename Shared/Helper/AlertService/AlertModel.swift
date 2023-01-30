//
//  AlertModel.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-05.
//

import Foundation
import SwiftUI

public struct AlertModel: Equatable {
    public init(
        title: String = "Default Title",
        type: AlertType = .top,
        autoDismiss: Bool = false,
        isTapToDismiss: Bool = false,
        isDragToDismiss: Bool = false,
        timer: Timer? = nil,
        description: String? = nil
    ) {
        self.title = title
        self.timer = timer
        self.description = description
    }

    public static func == (lhs: AlertModel, rhs: AlertModel) -> Bool {
        return lhs.id == rhs.id
    }

    let id: UUID = UUID()
    let type: AlertType = .top
    let title: String
    let autoDismiss: Bool = false
    let isTapToDismiss: Bool = false
    let isDragToDismiss: Bool = true
    let countDownTimer: Int = 2
    let alertAnimationDuration: Double = 1
    var timer: Timer?
    var description: String?
    var animation: Animation {
        switch type {
        case .top:
            return Animation.easeInOut(duration: alertAnimationDuration)
        case .center:
            return Animation.easeInOut(duration: alertAnimationDuration)
        case .bottom:
            return Animation.linear(duration: alertAnimationDuration)
        }
    }
}

public extension AlertModel {
    enum AlertType {
        case top
        case center
        case bottom

        var transition: AnyTransition {
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
    // Animation and Transition
//    private enum AlertTransition {
//        case top
//        case center
//        case bottom
//
//        public var value: AnyTransition {
//            switch self {
//            case .top:
//
//            case .center:
//
//            case .bottom:
//
//            }
//        }
//    }
}

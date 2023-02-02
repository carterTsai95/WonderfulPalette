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
        description: String? = nil,
        type: AlertType = .bottom,
        autoDismiss: Bool = false,
        isTapToDismiss: Bool = true,
        isDragToDismiss: Bool = true
    ) {
        self.title = title
        self.description = description
        self.type = type
        self.autoDismiss = autoDismiss
        self.isTapToDismiss = isTapToDismiss
        self.isDragToDismiss = isDragToDismiss
        self.description = description
    }

    public static func == (lhs: AlertModel, rhs: AlertModel) -> Bool {
        return lhs.id == rhs.id
    }

    let id: UUID = UUID()
    let type: AlertType
    let title: String
    let autoDismiss: Bool
    let isTapToDismiss: Bool
    let isDragToDismiss: Bool
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
        case .custom(_, _):
            return Animation.linear(duration: alertAnimationDuration)
        }
    }
    @ViewBuilder
    var alertView: some View {
        switch type {
        case .top:
            VStack {
                VStack(spacing: 20) {
                    Image(systemName: "checkmark")
                        .font(.title)
                    Text(title)
                        .fontWeight(.medium)
                    Text("Top")
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 35)
                .background(
                    .ultraThinMaterial
                )
                .cornerRadius(15)
                Spacer()
            }
        case .center:
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Image(systemName: "checkmark")
                        .font(.title)
                    Text("title")
                        .fontWeight(.medium)
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 35)
                .background(
                    .ultraThinMaterial
                )
                .cornerRadius(15)
                Spacer()
            }
        case .bottom:
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Image(systemName: "checkmark")
                        .font(.title)
                    Text("title")
                        .fontWeight(.medium)
                    Text("Toast")
                        .fontWeight(.medium)
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 35)
                .background(
                    .ultraThinMaterial
                )
                .cornerRadius(15)
            }
        case .custom(let view, let position):
            switch position {
            case .top:
                VStack {
                    AnyView(view)
                    Spacer()
                }
            case .center:
                VStack {
                    Spacer()
                    AnyView(view)
                    Spacer()
                }
            case .bottom:
                VStack {
                    Spacer()
                    AnyView(view)
                }
            }
        default:
            EmptyView()
        }
    }
}

public enum CustomViewPosition {
    case top
    case center
    case bottom
}
public enum AlertType {
    case top
    case center
    case bottom
    case custom(any View, CustomViewPosition)

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
        case .custom(let _, let position):
            switch position {
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
}

//
//  CustomAlertView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-04.
//

import SwiftUI

struct CustomAlertView: View {
    @EnvironmentObject var alertService: AlertsServiceBackend
    @GestureState private var dragState = DragState.inactive
    @State private var lastDragPosition: CGFloat = 0

    var alertModel: AlertModel

    var body: some View {
        alertView()
    }

    func alertViewBuilder() -> some View {
        Group {
            switch alertModel.type {
            case .top:
                VStack {
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark")
                            .font(.title)
                        Text(alertModel.title)
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
                        Text(alertModel.title)
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
                        Text(alertModel.title)
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
            }
        }
    }

    func alertView() -> some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, _ in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)

        return alertViewBuilder()
            .applyIf(alertModel.isDragToDismiss) {
                $0
                    .offset(y: dragOffset())
                    .simultaneousGesture(drag)
            }
    }
}

extension CustomAlertView {
    private enum DragState {
        case inactive
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
    }

    private func isDraggable(dragOffset: CGFloat) -> Bool {
        switch alertModel.type {
        case .top:
            return dragOffset < 0
        case .center:
            return dragOffset > 0
        case .bottom:
            return dragOffset > 0
        }
    }

    private func shouldRemoveAlert(_ dragOffset: CGFloat) -> Bool {
        let reference = 50.0

        switch alertModel.type {
        case .top:
            return dragOffset < reference
        case .center:
            return dragOffset > reference
        case .bottom:
            return dragOffset > reference
        }
    }

    private func dragOffset() -> CGFloat {
        if isDraggable(dragOffset: dragState.translation.height) {
            return dragState.translation.height
        }

        return withAnimation {
            lastDragPosition
        }
    }

    private func shouldUpdateLastDragPosition(dragOffset: CGFloat) -> Bool {
        switch alertModel.type {
        case .top:
            return dragOffset < 0
        case .center:
            return dragOffset < 0
        case .bottom:
            return dragOffset > 0
        }
    }

    private func onDragEnded(drag: DragGesture.Value) {
        if shouldUpdateLastDragPosition(dragOffset: drag.translation.height) {
            lastDragPosition = drag.translation.height
        }
        if shouldRemoveAlert(drag.translation.height) {
            alertService.removeAlert(alertModel)
        }

        withAnimation(.spring()) {
            lastDragPosition = 0
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            CustomAlertView(
                alertModel: .init(title: "Test Model")
            )
        )
    }
}

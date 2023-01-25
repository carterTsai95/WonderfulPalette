//
//  CustomAlertView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-04.
//

import SwiftUI

struct CustomAlertView: View {
    @EnvironmentObject var alertService: AlertsServiceBackend
    var alertModel: AlertModel

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
    @GestureState private var dragState = DragState.inactive
    @State private var lastDragPosition: CGFloat = 0
    func dragOffset() -> CGFloat {
        if (dragState.translation.height < 0) {
            return dragState.translation.height
        }
        return lastDragPosition
    }

    private func onDragEnded(drag: DragGesture.Value) {
        let reference = 100.0
        if (drag.translation.height < reference) {
            lastDragPosition = drag.translation.height
            withAnimation {
                lastDragPosition = 0
            }
            alertService.removeAlert(alertModel)
        }
    }

    var body: some View {
        alertView()
    }

    func alertView() -> some View {
        let view = VStack(spacing: 20) {
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
        let drag = DragGesture()
            .updating($dragState) { drag, state, _ in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        return view
            .applyIf(alertModel.isDragToDismiss) {
                $0.offset(y: dragOffset())
                    .simultaneousGesture(drag)
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

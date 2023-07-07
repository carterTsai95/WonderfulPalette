//
//  ColorCellView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-02.
//

import SwiftUI
import CTAlert

struct ColorCellView: View {
    @Environment(\.alertService) var alertService
    @ScaledMetric var cellSize: CGFloat = 55
    @State var showAlert = false

    let color: Color
    var viewModel: ColorCellViewModel

    init(
        color: Color
    ) {
        self.color = color
        self.viewModel = ColorCellViewModel(color: color)
    }

    var body: some View {
            Button {
                viewModel.copyToClipboard()
                alertService.presentAlert(
                    alertModel: AlertModel(
                        title: color.hexaRGB,
                        type: .default,
                        configuration: .init(
                            position: .top,
                            alertTransition: .custom(
                                .asymmetric(
                                    insertion: .slide,
                                    removal: .slide
                                ).combined(with: .opacity)
                            )
                        )
                    )
                )
            } label: {
                VStack(alignment: .center, spacing: 2) {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: cellSize, height: cellSize)
                }
                .overlay(
                    alignment: .bottom
                ) {
                    Text(color.hexaRGB)
                        .font(.caption2)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(color.contrastColor())
                }
            }
    }
}

struct ColorCellView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            ColorCellView(color: .red)
        )
    }
}

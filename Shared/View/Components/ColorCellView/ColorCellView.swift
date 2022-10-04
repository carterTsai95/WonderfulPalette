//
//  ColorCellView.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-02.
//

import SwiftUI

struct ColorCellView: View {
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
            showAlert.toggle()
        } label: {
            VStack(alignment: .center, spacing: 2) {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: cellSize, height: cellSize)
                Text(color.hexStringFromColor())
                    .font(.caption2)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.gray)
            }
            if showAlert {
                CustomAlertView(placeHolder: "Test", show: $showAlert)
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

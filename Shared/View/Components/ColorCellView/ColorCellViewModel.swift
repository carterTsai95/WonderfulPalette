//
//  ColorCellViewModel.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-03.
//

import SwiftUI

class ColorCellViewModel {
    private var pasteboard = UIPasteboard.general
    var color: Color

    init(
        color: Color
    ) {
        self.color = color
    }

    func copyToClipboard() {
        pasteboard.string = color.hexaRGB
    }
}

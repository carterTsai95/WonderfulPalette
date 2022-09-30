//
//  Color+Extension.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-09-28.
//

import SwiftUI
import UIKit

extension Color {
    var complement: Color {
        return Color(self.hueOffsetDegree(0.5))
    }

    var splitComplement0: Color {
        return Color(self.hueOffsetDegree(150 / 360))
    }

    var splitComplement1: Color {
        return Color(self.hueOffsetDegree(210 / 360))
    }

    var triadic0: Color {
        return Color(self.hueOffsetDegree(120 / 360))
    }

    var triadic1: Color {
        return Color(self.hueOffsetDegree(240 / 360))
    }

    var tetradic0: Color {
        return Color(self.hueOffsetDegree(0.25))
    }

    var tetradic1: Color {
        return self.complement
    }

    var tetradic2: Color {
        return Color(self.hueOffsetDegree(0.75))
    }

    var analagous0: Color {
        return Color(self.hueOffsetDegree(-1 / 12))
    }

    var analagous1: Color {
        return Color(self.hueOffsetDegree(1 / 12))
    }

    private func hueOffsetDegree(_ offset: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let color = UIColor(self)

        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

        return UIColor(
            hue: fmod(hue + offset, 1),
            saturation: saturation,
            brightness: brightness,
            alpha: alpha
        )
    }

    public func hexStringFromColor() -> String {
        let components = UIColor(self).cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        print(hexString)
        return hexString
     }

}

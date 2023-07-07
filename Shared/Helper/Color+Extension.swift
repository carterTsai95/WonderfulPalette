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
        return Color(self.hueOffsetDegree(11 / 12))
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

    /// Return the better contrasting color, white or black
    func contrastColor() -> Color {
        guard let (red, green, blue, _) = rgba else {
            return .black
        }

        let rgbArray: [CGFloat] = [red, green, blue]

        let luminanceArray = rgbArray.map({ value -> (CGFloat) in
            if value < 0.03928 {
                return (value / 12.92)
            } else {
                return (pow( (value + 0.055) / 1.055, 2.4) )
            }
        })

        let luminance =
        0.2126 * luminanceArray[0] +
        0.7152 * luminanceArray[1] +
        0.0722 * luminanceArray[2]

        return luminance > 0.179 ? Color.black : Color.white
    }

    public func hexStringFromColor() -> String {
        let components = UIColor(self).cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255))
        )
        return hexString
     }

    var uiColor: UIColor { .init(self) }

    typealias RGBA = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

    var rgba: RGBA? {
        var (r, g, b, a): RGBA = (0, 0, 0, 0)
        return uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) ? (r, g, b, a) : nil
    }

    var hexaRGB: String {
        guard let (red, green, blue, _) = rgba else { return "N/A" }
        return String(format: "#%02lX%02lX%02lX",
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255))
    }

    var hexaRGBA: String {
        guard let (red, green, blue, alpha) = rgba else { return "N/A" }
        return String(format: "#%02x%02x%02x%02x",
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255),
            Int(alpha * 255))
    }

}

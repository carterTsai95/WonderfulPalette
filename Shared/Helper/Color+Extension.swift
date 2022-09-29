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
        return Color(self.withHueOffset(0.5))
    }

    var splitComplement0: Color {
        return Color(self.withHueOffset(150 / 360))
    }

    var splitComplement1: Color {
        return Color(self.withHueOffset(210 / 360))
    }

    var triadic0: Color {
        return Color(self.withHueOffset(120 / 360))
    }

    var triadic1: Color {
        return Color(self.withHueOffset(240 / 360))
    }

    var tetradic0: Color {
        return Color(self.withHueOffset(0.25))
    }

    var tetradic1: Color {
        return self.complement
    }

    var tetradic2: Color {
        return Color(self.withHueOffset(0.75))
    }

    var analagous0: Color {
        return Color(self.withHueOffset(-1 / 12))
    }

    var analagous1: Color {
        return Color(self.withHueOffset(1 / 12))
    }
    
    private func withHueOffset(_ offset: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        let color = UIColor(self)

        color.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: fmod(h + offset, 1), saturation: s, brightness: b, alpha: a)
    }
}


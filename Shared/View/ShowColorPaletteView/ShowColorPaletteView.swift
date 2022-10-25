//
//  ShowColorPaletteView.swift
//  WonderfulPalette
//
//  Created by Hung-Chun Tsai on 2022-10-22.
//

import SwiftUI

struct ShowColorPaletteView: View {
    @State private var selectedColor: Color = .red

    var body: some View {
        ScrollView {
            ColorPicker(selection: $selectedColor) {
                Text("Select Primary Color")
            }.padding()
            VStack {
                Text("Primary Color")
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Circle()
                        .foregroundColor(selectedColor)
                        .frame(width: 45, height: 45)
                    Spacer()
                }

                // Complement
                ColorPatternContainer(
                    headerTitle: "1. Complement"
                ) {
                    HStack(spacing: 1.5) {
                        ColorCellView(color: selectedColor)
                        ColorCellView(color: selectedColor.complement)
                    }
                }

                // Split Complement
                ColorPatternContainer(
                    headerTitle: "2. Split Complement"
                ) {
                    HStack(spacing: 1.5) {
                        ColorCellView(color: selectedColor)
                        ColorCellView(color: selectedColor.splitComplement0)
                        ColorCellView(color: selectedColor.splitComplement1)
                    }
                }

                // Triadic
                ColorPatternContainer(
                    headerTitle: "3. Triadic"
                ) {
                    HStack(spacing: 1.5) {
                        ColorCellView(color: selectedColor)
                        ColorCellView(color: selectedColor.triadic0)
                        ColorCellView(color: selectedColor.triadic1)
                    }
                }

                // Tetradic
                ColorPatternContainer(
                    headerTitle: "4. Tetradic"
                ) {
                    HStack(spacing: 1.5) {
                        ColorCellView(color: selectedColor)
                        ColorCellView(color: selectedColor.tetradic0)
                        ColorCellView(color: selectedColor.tetradic1)
                        ColorCellView(color: selectedColor.tetradic2)
                    }
                }

                // Analagous
                ColorPatternContainer(
                    headerTitle: "5. Analagous"
                ) {
                    HStack(spacing: 1.5) {
                        ColorCellView(color: selectedColor)
                        ColorCellView(color: selectedColor.analagous0)
                        ColorCellView(color: selectedColor.analagous1)
                    }
                }
            }
            Spacer()
        }
        .background(Color("ColorBase"))
    }
}

struct ShowColorPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
        ShowColorPaletteView()
        )
    }
}

//
//  ColorPatternContainer.swift
//  WonderfulPalette (iOS)
//
//  Created by Hung-Chun Tsai on 2022-10-02.
//

import SwiftUI

struct ColorPatternContainer<Content: View>: View {
    let headerTitle: String
    @ViewBuilder var content: Content
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(headerTitle)
                    .fontWeight(.medium)
                Spacer()
            }

            Divider()

            // TODO: Refactoring with HStack that include all the color at once
            content
        }.padding([.horizontal, .bottom], 10)
    }
}
struct ColorPatternContainer_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            ColorPatternContainer(
                headerTitle: "1. Color Pattern"
            ) {
                HStack {
                    Rectangle()
                        .foregroundColor(.indigo)
                        .frame(width: 50, height: 50)
                    Rectangle()
                        .foregroundColor(.indigo.complement)
                        .frame(width: 50, height: 50)
                }
            }
        )
    }
}

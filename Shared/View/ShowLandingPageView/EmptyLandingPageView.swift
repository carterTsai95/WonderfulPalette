//
//  EmptyLandingPageView.swift
//  WonderfulPalette
//
//  Created by Hung-Chun Tsai on 2022-10-25.
//

import SwiftUI

struct EmptyLandingPageView: View {
    // MARK: - PROPERTIES

    @State private var isAnimated: Bool = false

    let images: [String] = [
      "illustration-no1",
      "illustration-no2",
      "illustration-no3"
    ]

    let tips: [String] = [
      "Colors are the smiles of nature.",
      "Nature always wears the colors of the spirit.",
      "Life is a painting, and you are the artist. You have on your palette all the colors in the spectrum.",
      "The colors live a remarkable life of their own after they have been applied to the canvas.",
      "Colors must fit together as pieces in a puzzle or cogs in a wheel.",
      "Life is like a box of crayons.",
      "The soul becomes dyed with the color of its thoughts."
    ]

    // MARK: - BODY
    var body: some View {
      ZStack {
        VStack(alignment: .center, spacing: 20) {
          Image("\(images.randomElement() ?? self.images[0])")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
            .layoutPriority(1)
          Text("\(tips.randomElement() ?? self.tips[0])")
            .layoutPriority(0.5)
            .font(.system(.headline, design: .rounded))
        } //: VSTACK
          .padding(.horizontal)
          .opacity(isAnimated ? 1 : 0)
          .offset(y: isAnimated ? 0 : -50)
          .onAppear(perform: {
              withAnimation(.easeOut(duration: 1.5)) {
                  self.isAnimated.toggle()
              }
          })
      } //: ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyLandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(EmptyLandingPageView())
    }
}

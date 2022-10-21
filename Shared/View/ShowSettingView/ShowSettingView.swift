//
//  ShowSettingView.swift
//  WonderfulPalette
//
//  Created by Hung-Chun Tsai on 2022-10-20.
//

import SwiftUI

struct ShowSettingView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                Form {
                    // MARK: - SECTION 1
                    Section(header: Text("Follow me on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Instagram", link: "https://www.instagram.com/hungchun.tsai/")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "LinkedIn", link: "https://www.linkedin.com/in/hung-chun-carter-tsai-372584175/")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Swift Tutorial", link: "https://cartertsai.hashnode.dev")
                    } //: SECTION 1
                    .padding(.vertical, 3)

                    // MARK: - SECTION 2
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Wonderful Palette")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Hung-Chun, Tsai (Carter)")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Hung-Chun, Tsai (Carter)")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "0.1.0")
                    } //: SECTION 2
                    .padding(.vertical, 3)
                }

                // MARK: - FOOTER
                Text("Copyright © All rights reserved.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            }//: VStack
            .navigationBarTitle("Settings", displayMode: .large)
        } //: NAVIGATION
    }
}

struct ShowSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(
            ShowSettingView()
        )
    }
}

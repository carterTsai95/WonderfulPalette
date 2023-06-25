//
//  HomePageView.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-09-27.
//

import SwiftUI
import CTAlert

struct HomePageView: View {
    var body: some View {
        TabView {
            ShowColorPaletteView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ShowSettingView()
                .tabItem {
                    Label("Setting", systemImage: "list.dash")
                }
        }.alertsPresentation()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(AlertsServiceBackend())
    }
}

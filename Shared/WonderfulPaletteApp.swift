//
//  WonderfulPaletteApp.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-09-27.
//

import SwiftUI
import Combine
import CTAlert

@main
struct WonderfulPaletteApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView()
                //.alertsPresentation()
        }
    }
}

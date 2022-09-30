//
//  WonderfulPaletteTests.swift
//  WonderfulPaletteTests
//
//  Created by Hung-Chun Tsai on 2022-09-30.
//

import XCTest
import SwiftUI
import WonderfulPalette

class WonderfulPaletteTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testhexStringFromColor() throws {
        // Given
        let color1 = Color(red: 1, green: 0, blue: 0)
        let color2 = Color(red: 0, green: 1, blue: 0)
        let color3 = Color(red: 0, green: 0, blue: 1)

        // When
        let color1Hex = color1.hexStringFromColor()
        let color2Hex = color2.hexStringFromColor()
        let color3Hex = color3.hexStringFromColor()

        // Expected
        XCTAssertEqual(color1Hex, "#FF0000")
        XCTAssertEqual(color2Hex, "#00FF00")
        XCTAssertEqual(color3Hex, "#0000FF")
    }
}

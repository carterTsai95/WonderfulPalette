//
//  HomePageView.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-09-27.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedColor: Color = .red
    var body: some View {
        VStack {
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
                    HStack {
                        VStack(alignment: .center, spacing: 2) {
                            Rectangle()
                                .foregroundColor(selectedColor)
                                .frame(width: 50, height: 50)
                            Text(selectedColor.hexStringFromColor())
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        Rectangle()
                            .foregroundColor(selectedColor.complement)
                            .frame(width: 50, height: 50)
                    }
                }

                // Split Complement
                ColorPatternContainer(
                    headerTitle: "2. Split Complement"
                ) {
                    HStack {
                        Rectangle()
                            .foregroundColor(selectedColor)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.splitComplement0)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.splitComplement1)
                            .frame(width: 50, height: 50)
                    }
                }

                // Triadic
                ColorPatternContainer(
                    headerTitle: "3. Triadic"
                ) {
                    HStack {
                        Rectangle()
                            .foregroundColor(selectedColor)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.triadic0)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.triadic1)
                            .frame(width: 50, height: 50)
                    }
                }

                // Tetradic
                ColorPatternContainer(
                    headerTitle: "4. Tetradic"
                ) {
                    HStack {
                        Rectangle()
                            .foregroundColor(selectedColor)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.tetradic0)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.tetradic1)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.tetradic2)
                            .frame(width: 50, height: 50)
                    }
                }

                // Analagous
                ColorPatternContainer(
                    headerTitle: "5. Analagous"
                ) {
                    HStack {
                        Rectangle()
                            .foregroundColor(selectedColor)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.analagous0)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.analagous1)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

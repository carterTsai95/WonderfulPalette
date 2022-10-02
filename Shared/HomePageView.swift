//
//  ContentView.swift
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
                VStack(alignment: .leading) {
                    HStack {
                        Text("1. Complement")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Rectangle()
                            .foregroundColor(selectedColor)
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .foregroundColor(selectedColor.complement)
                            .frame(width: 50, height: 50)
                    }
                    Text(selectedColor.complement.hexStringFromColor())

                }.padding([.horizontal, .bottom], 10)

                // Split Complement
                VStack(alignment: .leading) {
                    HStack {
                        Text("2. Split Complement")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    Divider()
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
                }.padding([.horizontal, .bottom], 10)

                // Triadic
                VStack(alignment: .leading) {
                    HStack {
                        Text("3. Triadic")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    Divider()
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
                }.padding([.horizontal, .bottom], 10)

                // Tetradic
                VStack(alignment: .leading) {
                    HStack {
                        Text("4. Tetradic")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    Divider()
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
                }.padding([.horizontal, .bottom], 10)

                // Analagous
                VStack(alignment: .leading) {
                    HStack {
                        Text("5. Tetradic")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    Divider()
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
                }.padding([.horizontal, .bottom], 10)
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

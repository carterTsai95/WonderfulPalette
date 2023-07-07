//
//  ToastExample.swift
//  WonderfulPalette
//
//  Created by Hung-Chun Tsai on 2023-07-02.
//

import SwiftUI
import CTAlert

struct ToastsExampleView: View {
    let toastTypes: [AlertPosition] = AlertPosition.allCases
    @Environment(\.alertService) var alertService

    @State private var alertPosition: AlertPosition = .top
    @State private var customToast = false

    @State private var autoDismiss = "True"
    var autoDismissCases = ["True", "False"]

    @State private var dragToDismiss = "True"
    var dragToDismissCases = ["True", "False"]

    @State private var tapToDismiss = "True"
    var tapToDismissCases = ["True", "False"]

    var body: some View {
        VStack {
            customToastControl
            positionSegmentedControl
            autoDismissSegmentedControl
            dragToDismissSegmentedControl
            tapToDismissSegmentedControl
        }
        .padding(.horizontal, 20)

        Button("Generate Toast") {
            customToast ?
            alertService.presentAlert(
                alertModel: AlertModel(
                    title: "Title",
                    description: "Description",
                    type: .default,
                    configuration: buildConfiguration()
                )
            ) :
            alertService.presentAlert(
                alertModel: AlertModel(
                    title: "",
                    description: "",
                    type: .custom(testCustomToast, alertPosition),
                    configuration: buildConfiguration()
                )
            )
        }
    }

    func buildConfiguration() -> AlertConfiguration {
        let autoDismiss, isTapToDismiss, isDragToDismiss: Bool

        if self.autoDismiss == "True" {
            autoDismiss = true
        } else {
            autoDismiss = false
        }

        if self.tapToDismiss == "True" {
            isTapToDismiss = true
        } else {
            isTapToDismiss = false
        }

        if self.dragToDismiss == "True" {
            isDragToDismiss = true
        } else {
            isDragToDismiss = false
        }

        return AlertConfiguration(
            position: alertPosition,
            alertTransition: .default,
            isAutoDismiss: autoDismiss,
            isDragToDismiss: isDragToDismiss,
            isTapToDismiss: isTapToDismiss
        )
    }

    // MARK: Position
    @ViewBuilder
    var positionSegmentedControl: some View {
        Text("Position")
        Divider()
        Picker("Position", selection: $alertPosition) {
            ForEach(toastTypes, id: \.self) {
                Text("\($0.label)")
                    .tag($0)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
    }

    // MARK: Custom Toast
    @ViewBuilder
    var customToastControl: some View {
        VStack {
            Toggle("Toggle Custom Toast", isOn: $customToast)
            Divider()
        }
        .padding(.bottom)
    }

    // MARK: Auto Dismiss
    @ViewBuilder
    var autoDismissSegmentedControl: some View {
        Text("Auto Dismiss")
        Divider()
        Picker("Auto Dismiss", selection: $autoDismiss) {
            ForEach(autoDismissCases, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
    }

    // MARK: Drag To Dismiss
    @ViewBuilder
    var dragToDismissSegmentedControl: some View {
        Text("Drag To Dismiss")
        Divider()
        Picker("Drag To Dismiss", selection: $dragToDismiss) {
            ForEach(dragToDismissCases, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
    }

    // MARK: Tap To Dismiss
    @ViewBuilder
    var tapToDismissSegmentedControl: some View {
        Text("Tap to dismiss")
        Divider()
        Picker("Tap to dismiss", selection: $tapToDismiss) {
            ForEach(tapToDismissCases, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
    }

    @ViewBuilder
    var testCustomToast: some View {
        VStack {
            VStack(spacing: 20) {
                Image(systemName: "checkmark")
                    .font(.title)
                Text("Custom Toast")
                    .fontWeight(.medium)
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 35)
            .background(
                .blue
            )
            .cornerRadius(15)
        }
    }
}

struct ToastsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ToastsExampleView()
    }
}

//
//  PrimaryButton.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct PrimaryButton<Label: View>: View {
    let isEnabled: Bool
    let action: () -> Void
    let label: () -> Label

    init(
        isEnabled: Bool = true,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.isEnabled = isEnabled
        self.action = action
        self.label = label
    }

    var body: some View {
        Button(action: action) {
            label()
                .font(Style.Fonts.buttonTitle)
                .foregroundStyle(
                    isEnabled
                    ? Style.Colors.primaryAction
                    : Style.Colors.disabledAction
                )
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
        .disabled(isEnabled.not)
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryButton(
            isEnabled: true,
            action: {}
        ) {
            Label("Enabled Button", systemImage: "checkmark.circle")
        }

        PrimaryButton(
            isEnabled: false,
            action: {}
        ) {
            Label("Disabled Button", systemImage: "xmark.circle")
        }
    }
    .padding()
}

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
                .font(Style.Font.buttonTitle)
                .foregroundStyle(
                    isEnabled
                    ? Style.Color.primaryAction
                    : Style.Color.disabledAction
                )
                .frame(maxWidth: .infinity)
        }
        .disabled(isEnabled.not)
    }
}

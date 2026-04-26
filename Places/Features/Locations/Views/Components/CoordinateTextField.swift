//
//  CoordinateTextField.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import SwiftUI

struct CoordinateTextField: View {
    @Binding var text: String
    let placeholder: String
    var focus: FocusState<Bool>.Binding
    let accessibilityLabel: String
    let accessibilityHint: String

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.decimalPad)
            .focused(focus)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
    }
}

#Preview {
    @Previewable @State var text = ""
    @Previewable @FocusState var isFocused: Bool

    return Form {
        CoordinateTextField(
            text: $text,
            placeholder: "Latitude",
            focus: $isFocused,
            accessibilityLabel: "Latitude field",
            accessibilityHint: "Enter latitude value"
        )
    }
}

#Preview("With Value") {
    @Previewable @State var text = "52.3"
    @Previewable @FocusState var isFocused: Bool

    return Form {
        CoordinateTextField(
            text: $text,
            placeholder: "Latitude",
            focus: $isFocused,
            accessibilityLabel: "Latitude field",
            accessibilityHint: "Enter latitude value"
        )
    }
}

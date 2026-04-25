//
//  ErrorView.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        ContentUnavailableView(
            Localization.Locations.errorTitle,
            systemImage: Style.Icon.error,
            description: Text(message)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("Error") {
    ErrorView(message: "Something went wrong. Please try again.")
}

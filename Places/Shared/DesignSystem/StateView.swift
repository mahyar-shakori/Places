//
//  StateView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ErrorView: View {
    let message: String

    var body: some View {
        ContentUnavailableView(
            L10n.Locations.errorTitle,
            systemImage: Style.Icon.error,
            description: Text(message)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

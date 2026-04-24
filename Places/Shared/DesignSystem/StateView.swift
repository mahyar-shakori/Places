//
//  AppStateView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct AppLoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AppErrorView: View {
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

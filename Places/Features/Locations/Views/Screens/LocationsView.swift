//
//  LocationsView.swift
//  Places
//
//  Created by Mahyar on 23/04/2026.
//

import SwiftUI

struct LocationsView: View {
    @State private var viewModel: LocationsViewModel
    @Environment(\.openURL) private var openURL
    @State private var showsWikipediaAlert = false

    init(viewModel: LocationsViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle(Localization.Common.placesTitle)
        }
        .task {
            await viewModel.loadLocationsIfNeeded()
        }
        .basicAlert(isPresented: $showsWikipediaAlert)
    }
}

// MARK: - Content

private extension LocationsView {
    @ViewBuilder
    var content: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if let errorMessage = viewModel.errorMessage {
            ErrorView(message: errorMessage)
        } else {
            locationsList
        }
    }

    var locationsList: some View {
        List(viewModel.locations) { location in
            Button {
                openWikipedia(url: location.wikipediaURL)
            } label: {
                LocationRowView(location: location)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Actions

private extension LocationsView {
    func openWikipedia(url: URL?) {
        guard let url else {
            return
        }

        openURL(url) { accepted in
            showsWikipediaAlert = accepted.not
        }
    }
}

#Preview {
    LocationsView(
        viewModel: LocationsViewModel(
            repository: LocationsRepository(
                apiService: APIService()
            )
        )
    )
}

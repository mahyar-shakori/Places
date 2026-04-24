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
                .navigationTitle(L10n.Common.placesTitle)
        }
        .task {
            await viewModel.loadLocations()
        }
        .wikipediaNotInstalledAlert(isPresented: $showsWikipediaAlert)
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
                openWikipedia(for: location)
            } label: {
                LocationRowView(location: location)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Actions

private extension LocationsView {
    func openWikipedia(for location: PlaceLocation) {
        guard let url = WikipediaURLBuilder.makeURL(
            latitude: location.latitude,
            longitude: location.longitude
        ) else {
            return
        }
        openURL(url) { accepted in
            if accepted.not {
                showsWikipediaAlert = true
            }
        }
    }
}

#Preview {
    LocationsView(
        viewModel: LocationsViewModel(
            apiService: APIService()
        )
    )
}

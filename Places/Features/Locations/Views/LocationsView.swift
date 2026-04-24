//
//  LocationsView.swift
//  Places
//
//  Created by Mahyar on 23/04/2026.
//

import SwiftUI

struct LocationsView: View {
    @State private var viewModel: LocationsViewModel

    init(viewModel: LocationsViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Places")
        }
        .task {
            await viewModel.loadLocations()
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.errorMessage {
            Text(error)
                .multilineTextAlignment(.center)
                .padding()
        } else {
            List(viewModel.locations) { location in
                Button {
                    openWikipedia(for: location)
                } label: {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(location.name ?? "Unknown location")
                            .font(.body)

                        Text("\(location.latitude), \(location.longitude)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private func openWikipedia(for location: PlaceLocation) {
        guard let name = location.name else { return }

        let formatted = name.replacingOccurrences(of: " ", with: "_")
        let urlString = "https://en.wikipedia.org/wiki/\(formatted)"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
//
//#Preview {
//    LocationsView()
//}


import SwiftUI

struct RootView: View {
    let container: AppContainer

    var body: some View {
        TabView {
            LocationsView(
                viewModel: container.makeLocationsViewModel()
            )
            .tabItem {
                Label("Places", systemImage: "location.circle")
            }

            CustomLocationView()
                .tabItem {
                    Label("Custom", systemImage: "plus.square")
                }
        }
    }
}


struct CustomLocationView: View {
    @State private var latitude = ""
    @State private var longitude = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    TextField("Latitude", text: $latitude)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)

                    TextField("Longitude", text: $longitude)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }

                Button("Open in Wikipedia") {
                    openWikipedia()
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationTitle("Custom")
        }
    }

    private func openWikipedia() {
        guard let lat = Double(latitude),
              let long = Double(longitude) else { return }

        let urlString = "https://en.wikipedia.org/wiki/\(lat),\(long)"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

//
//  CustomLocationView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct CustomLocationView: View {
    @State private var viewModel: CustomLocationViewModel
    @FocusState private var isFocused: Bool

    init(viewModel: CustomLocationViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Form {
                coordinatesSection
                actionSection
                infoSection
            }
            .dismissKeyboard(focus: $isFocused)
            .navigationTitle(L10n.Common.customLocationTitle)
        }
    }
}

// MARK: - Sections

private extension CustomLocationView {
    var coordinatesSection: some View {
        Section(L10n.CustomLocation.enterCoordinates) {
            TextField(
                L10n.CustomLocation.latitudePlaceholder,
                text: $viewModel.latitude
            )
            .keyboardType(.decimalPad)
            .focused($isFocused)

            TextField(
                L10n.CustomLocation.longitudePlaceholder,
                text: $viewModel.longitude
            )
            .keyboardType(.decimalPad)
            .focused($isFocused)
        }
    }
    
    var actionSection: some View {
        Section {
            PrimaryButton(
                isEnabled: viewModel.isValidCoordinate,
                action: openWikipedia
            ) {
                Label(
                    L10n.CustomLocation.openWikipedia,
                    systemImage: Style.Icon.globe
                )
            }
        }
    }

    var infoSection: some View {
        Section {
            Text(L10n.CustomLocation.description)
                .font(Style.Font.body)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Actions

private extension CustomLocationView {
    func openWikipedia() {
        guard let coordinate = viewModel.coordinate else { return }

        print(coordinate.latitude, coordinate.longitude)
    }
}

#Preview {
    CustomLocationView(
        viewModel: CustomLocationViewModel()
    )
}

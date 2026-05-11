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
    @Environment(\.openURL) private var openURL
    @State private var showsWikipediaAlert = false
    
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
            .navigationTitle(Localization.Common.customLocationTitle)
        }
        .basicAlert(isPresented: $showsWikipediaAlert)
    }
}

// MARK: - Sections

private extension CustomLocationView {
    var coordinatesSection: some View {
        Section(Localization.CustomLocation.enterCoordinates) {
            CoordinateTextField(
                text: $viewModel.latitude,
                placeholder: Localization.CustomLocation.latitudePlaceholder,
                focus: $isFocused,
                accessibilityLabel: Localization.Accessibility.latitudeField,
                accessibilityHint: Localization.Accessibility.latitudeHint
            )
            
            CoordinateTextField(
                text: $viewModel.longitude,
                placeholder: Localization.CustomLocation.longitudePlaceholder,
                focus: $isFocused,
                accessibilityLabel: Localization.Accessibility.longitudeField,
                accessibilityHint: Localization.Accessibility.longitudeHint
            )
        }
    }
    
    var actionSection: some View {
        Section {
            PrimaryButton(
                isEnabled: viewModel.isValidCoordinate,
                action: {
                    openWikipedia(url: viewModel.wikipediaURL)
                }
            ) {
                Label(
                    Localization.CustomLocation.openWikipedia,
                    systemImage: Style.Icon.globe
                )
            }
            .accessibilityLabel(Localization.Accessibility.openWikipediaButton)
            .accessibilityHint(viewModel.openWikipediaButtonAccessibilityHint)
        }
    }

    var infoSection: some View {
        Section {
            Text(Localization.CustomLocation.description)
                .font(Style.Fonts.body)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Actions

private extension CustomLocationView {
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
    CustomLocationView(
        viewModel: CustomLocationViewModel()
    )
}

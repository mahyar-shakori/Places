//
//  LocationRowView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct LocationRowView: View {
    let location: PlaceLocation
    
    private var coordinatesText: String {
        CoordinateDisplayFormatter.text(
            latitude: location.latitude,
            longitude: location.longitude
        )
    }

    var body: some View {
        HStack(spacing: Style.Spacing.medium) {
            content
            Spacer()
            chevron
        }
        .padding(.vertical, Style.Spacing.xSmall)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(location.accessibilityTitle)
        .accessibilityHint(Localization.Accessibility.openWikipediaHint)
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Subviews

private extension LocationRowView {

    var content: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.xSmall) {
            title
            subtitle
        }
    }

    var title: some View {
        Text(location.name ?? Localization.Locations.unknownTitle)
            .font(Style.Fonts.rowTitle)
            .foregroundStyle(.primary)
            .lineLimit(nil)
    }

    var subtitle: some View {
        Text(coordinatesText)
            .font(Style.Fonts.rowSubtitle)
            .foregroundStyle(.secondary)
            .monospacedDigit()
            .lineLimit(nil)
    }

    var chevron: some View {
        Image(systemName: Style.Icon.chevron)
            .font(Style.Fonts.rowSubtitle)
            .foregroundStyle(.tertiary)
    }
}

#Preview {
    LocationRowView(
        location: PlaceLocation.preview
    )
    .padding()
}

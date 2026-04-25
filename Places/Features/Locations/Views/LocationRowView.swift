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
        "\(location.latitude), \(location.longitude)"
    }
    
    private var accessibilityTitle: String {
        CoordinateAccessibilityFormatter.label(
            name: location.name ?? L10n.Locations.unknownTitle,
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
        .accessibilityLabel(accessibilityTitle)
        .accessibilityHint(L10n.Accessibility.openWikipediaHint)
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
        Text(location.name ?? L10n.Locations.unknownTitle)
            .font(Style.Font.rowTitle)
            .foregroundStyle(.primary)
            .lineLimit(nil)
    }

    var subtitle: some View {
        Text(coordinatesText)
            .font(Style.Font.rowSubtitle)
            .foregroundStyle(.secondary)
            .monospacedDigit()
            .lineLimit(nil)
    }

    var chevron: some View {
        Image(systemName: Style.Icon.chevron)
            .font(Style.Font.rowSubtitle)
            .foregroundStyle(.tertiary)
    }
}

#Preview {
    LocationRowView(
        location: PlaceLocation(
            name: "Amsterdam",
            latitude: 52.3547498,
            longitude: 4.8339215
        )
    )
    .padding()
}

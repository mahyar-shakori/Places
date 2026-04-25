//
//  CoordinateAccessibilityFormatter.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation

enum CoordinateAccessibilityFormatter {
    static func label(
        name: String,
        latitude: Double,
        longitude: Double
    ) -> String {
        let latitudeDirection = latitude >= 0
            ? L10n.Accessibility.north
            : L10n.Accessibility.south

        let longitudeDirection = longitude >= 0
            ? L10n.Accessibility.east
            : L10n.Accessibility.west

        return String(
            format: L10n.Accessibility.locationLabel,
            name,
            abs(latitude),
            latitudeDirection,
            abs(longitude),
            longitudeDirection
        )
    }
}

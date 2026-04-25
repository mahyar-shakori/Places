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
            ? Localization.Accessibility.north
            : Localization.Accessibility.south

        let longitudeDirection = longitude >= 0
            ? Localization.Accessibility.east
            : Localization.Accessibility.west

        return String(
            format: Localization.Accessibility.locationLabel,
            name,
            abs(latitude),
            latitudeDirection,
            abs(longitude),
            longitudeDirection
        )
    }
}

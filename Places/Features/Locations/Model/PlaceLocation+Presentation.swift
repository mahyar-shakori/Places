//
//  PlaceLocation+Presentation.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation

extension PlaceLocation {
    var wikipediaURL: URL? {
        WikipediaURLBuilder.makeURL(
            latitude: latitude,
            longitude: longitude
        )
    }

    var accessibilityTitle: String {
        CoordinateAccessibilityFormatter.label(
            name: name ?? Localization.Locations.unknownTitle,
            latitude: latitude,
            longitude: longitude
        )
    }
}

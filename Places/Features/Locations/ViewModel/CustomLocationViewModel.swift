//
//  CustomLocationViewModel.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Observation

@Observable
final class CustomLocationViewModel {
    var latitude = ""
    var longitude = ""
    
    var isValidCoordinate: Bool {
        coordinate != nil
    }

    var openWikipediaURL: URL? {
        guard let coordinate else {
            return nil
        }

        return WikipediaURLBuilder.makeURL(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
    }

    var openWikipediaButtonAccessibilityHint: String {
        isValidCoordinate
        ? Localization.Accessibility.openWikipediaHint
        : Localization.Accessibility.openWikipediaRequirementHint
    }

    private var coordinate: (latitude: Double, longitude: Double)? {
        CoordinateValidator.coordinate(
            latitude: latitude,
            longitude: longitude
        )
    }
}

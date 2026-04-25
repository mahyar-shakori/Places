//
//  PlaceLocation+Presentation.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct PlaceLocationPresentationTests {

    @Test(arguments: [
        (10.0, 20.0, "lat=10.0", "long=20.0"),
        (-10.0, -20.0, "lat=-10.0", "long=-20.0")
    ])
    func wikipediaURLIsGeneratedCorrectly(
        latitude: Double,
        longitude: Double,
        latComponent: String,
        longComponent: String
    ) {
        let location = PlaceLocation(
            name: "Test",
            latitude: latitude,
            longitude: longitude
        )
        let url = location.wikipediaURL

        #expect(url?.absoluteString.contains(latComponent) == true)
        #expect(url?.absoluteString.contains(longComponent) == true)
    }

    @Test
    func accessibilityTitleUsesNameWhenAvailable() {
        let location = PlaceLocation(
            name: "Amsterdam",
            latitude: 10,
            longitude: 20
        )
        let title = location.accessibilityTitle

        #expect(title.contains("Amsterdam"))
    }

    @Test
    func accessibilityTitleFallsBackToUnknownName() {
        let location = PlaceLocation(
            name: nil,
            latitude: 10,
            longitude: 20
        )
        let title = location.accessibilityTitle

        #expect(title.contains(Localization.Locations.unknownTitle))
    }

    @Test
    func accessibilityTitleIncludesDirections() {
        let location = PlaceLocation(
            name: "Test",
            latitude: -10,
            longitude: 20
        )
        let title = location.accessibilityTitle

        #expect(title.contains(Localization.Accessibility.south))
        #expect(title.contains(Localization.Accessibility.east))
    }
}

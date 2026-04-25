//
//  CoordinateAccessibilityFormatterTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

@MainActor
struct CoordinateAccessibilityFormatterTests {

    @Test
    func labelFormatsPositiveCoordinatesCorrectly() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Amsterdam",
            latitude: 52.36,
            longitude: 4.90
        )

        #expect(result.contains("Amsterdam"))
        #expect(result.contains("52.36"))
        #expect(result.contains("4.9"))
        #expect(result.contains(Localization.Accessibility.north))
        #expect(result.contains(Localization.Accessibility.east))
    }

    @Test
    func labelFormatsNegativeCoordinatesCorrectly() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Sydney",
            latitude: -33.86,
            longitude: -151.20
        )

        #expect(result.contains("Sydney"))
        #expect(result.contains("33.86"))
        #expect(result.contains("151.2"))
        #expect(result.contains(Localization.Accessibility.south))
        #expect(result.contains(Localization.Accessibility.west))
    }

    @Test
    func labelHandlesZeroCoordinatesAsPositiveDirections() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Equator",
            latitude: 0,
            longitude: 0
        )

        #expect(result.contains("Equator"))
        #expect(result.contains("0"))
        #expect(result.contains(Localization.Accessibility.north))
        #expect(result.contains(Localization.Accessibility.east))
    }

    @Test
    func labelUsesAbsoluteValuesForCoordinates() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Test",
            latitude: -10,
            longitude: -20
        )

        #expect(result.contains("10"))
        #expect(result.contains("20"))
    }
}

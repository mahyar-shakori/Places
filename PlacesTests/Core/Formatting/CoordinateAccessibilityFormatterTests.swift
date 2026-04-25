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
        #expect(result.contains(L10n.Accessibility.north))
        #expect(result.contains(L10n.Accessibility.east))
    }
    
    @Test
    func labelFormatsNegativeCoordinatesCorrectly() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Sydney",
            latitude: -33.86,
            longitude: -151.20
        )
        
        #expect(result.contains(L10n.Accessibility.south))
        #expect(result.contains(L10n.Accessibility.west))
    }
    
    @Test
    func labelHandlesZeroCoordinates() {
        let result = CoordinateAccessibilityFormatter.label(
            name: "Equator",
            latitude: 0,
            longitude: 0
        )

        #expect(result.contains(L10n.Accessibility.north))
        #expect(result.contains(L10n.Accessibility.east))
    }
}

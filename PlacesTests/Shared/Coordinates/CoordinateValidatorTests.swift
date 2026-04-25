//
//  CoordinateValidatorTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

@MainActor
struct CoordinateValidatorTests {

    @Test(arguments: [
        ("52.36", "4.90", 52.36, 4.9),
        ("90", "180", 90, 180),
        ("-90", "-180", -90, -180)
    ])
    func returnsCoordinateWhenInputIsValid(
        latitude: String,
        longitude: String,
        expectedLatitude: Double,
        expectedLongitude: Double
    ) {
        let result = CoordinateValidator.coordinate(
            latitude: latitude,
            longitude: longitude
        )

        #expect(result?.latitude == expectedLatitude)
        #expect(result?.longitude == expectedLongitude)
    }

    @Test(arguments: [
        ("91", "4.90"),
        ("-91", "4.90"),
        ("52.36", "181"),
        ("52.36", "-181"),
        ("abc", "4.90"),
        ("52.36", "xyz"),
        ("", "4.90"),
        ("52.36", "")
    ])
    func returnsNilWhenInputIsInvalid(
        latitude: String,
        longitude: String
    ) {
        let result = CoordinateValidator.coordinate(
            latitude: latitude,
            longitude: longitude
        )

        #expect(result == nil)
    }
} 

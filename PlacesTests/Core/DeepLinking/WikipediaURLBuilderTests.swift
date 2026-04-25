//
//  WikipediaURLBuilderTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct WikipediaURLBuilderTests {

    @Test(arguments: [
        (52.3676, 4.9041, "wikipedia://places?lat=52.3676&long=4.9041"),
        (-33.8688, -151.2093, "wikipedia://places?lat=-33.8688&long=-151.2093")
    ])
    func makeURLCreatesExpectedWikipediaURL(
        latitude: Double,
        longitude: Double,
        expectedURL: String
    ) {
        let url = WikipediaURLBuilder.makeURL(
            latitude: latitude,
            longitude: longitude
        )
        
        #expect(url?.absoluteString == expectedURL)
    }
}

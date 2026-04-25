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

    @Test
    func makeURLCreatesExpectedWikipediaURL() {
        let url = WikipediaURLBuilder.makeURL(
            latitude: 52.3676,
            longitude: 4.9041
        )

        #expect(url?.absoluteString == "wikipedia://places?lat=52.3676&long=4.9041")
    }

    @Test
    func makeURLHandlesNegativeCoordinates() {
        let url = WikipediaURLBuilder.makeURL(
            latitude: -33.8688,
            longitude: -151.2093
        )

        #expect(url?.absoluteString == "wikipedia://places?lat=-33.8688&long=-151.2093")
    }
}

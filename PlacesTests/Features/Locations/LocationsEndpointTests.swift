//
//  LocationsEndpointTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

struct LocationsEndpointTests {

    @Test
    func locationsEndpointCreatesExpectedRequest() throws {
        let request = try LocationsEndpoint.locations.asURLRequest()

        #expect(request.httpMethod == "GET")
        #expect(request.url?.absoluteString == "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")
        #expect(request.timeoutInterval == 30)
    }
}

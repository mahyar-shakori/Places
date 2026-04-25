//
//  LocationsEndpointTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct LocationsEndpointTests {

    @Test
    func locationsEndpointCreatesExpectedRequest() throws {
        let request = try LocationsEndpoint.locations.asURLRequest()

        #expect(request.httpMethod == "GET")
        #expect(request.url?.absoluteString == "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")
        #expect(request.timeoutInterval == 30)
    }
    
    @Test
    func locationsEndpointReturnsCorrectURL() {
        let endpoint = LocationsEndpoint.locations

        #expect(
            endpoint.url?.absoluteString ==
            "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
        )
    }
    
    @Test
    func locationsEndpointUsesGETMethod() {
        let endpoint = LocationsEndpoint.locations

        #expect(endpoint.method == .get)
    }
}

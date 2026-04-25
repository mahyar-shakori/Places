//
//  LocationsIntegrationTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct LocationsIntegrationTests {

    @Test(.disabled("Relies on external network"))
    func fetchLocationsFromRemoteAPI() async throws {
        let apiService = APIService()

        let response = try await apiService.fetchData(
            from: LocationsEndpoint.locations,
            as: LocationsResponse.self
        )
        #expect(response.locations.isNotEmpty)
    }
}

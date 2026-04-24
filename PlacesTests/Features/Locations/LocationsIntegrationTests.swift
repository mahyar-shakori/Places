//
//  LocationsIntegrationTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

struct LocationsIntegrationTests {

    @Test(.disabled("Relies on external network"))
    func fetchLocationsFromRemoteAPI() async throws {
        let service = await LocationsService(
            apiService: APIService()
        )

        let locations = try await service.fetchLocations()

        #expect(locations.isNotEmpty)
    }
}

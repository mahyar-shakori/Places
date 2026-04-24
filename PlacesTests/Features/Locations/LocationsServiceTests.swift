//
//  LocationsServiceTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

struct LocationsServiceTests {

    @Test
    func fetchLocationsReturnsDecodedLocations() async throws {
        let mockAPIService = MockAPIService<LocationsService.Response>(
            result: .success(LocationsTestData.response)
        )

        let service = LocationsService(apiService: mockAPIService)

        let locations = try await service.fetchLocations()

        #expect(locations.count == 2)
        #expect(locations.first == LocationsTestData.amsterdam)
        #expect(locations.last?.name == nil)
    }

    @Test
    func fetchLocationsThrowsWhenAPIServiceFails() async {
        let mockAPIService = MockAPIService<LocationsService.Response>(
            result: .failure(.invalidResponse)
        )

        let service = LocationsService(apiService: mockAPIService)

        do {
            _ = try await service.fetchLocations()
            Issue.record("Expected fetchLocations to throw.")
        } catch let error as NetworkError {
            #expect(error == .invalidResponse)
        } catch {
            Issue.record("Expected NetworkError.invalidResponse, got \(error).")
        }
    }
}

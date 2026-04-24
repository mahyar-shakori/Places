//
//  LocationsViewModelTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct LocationsViewModelTests {

    @Test
    func loadLocationsSetsLocationsWhenServiceSucceeds() async {
        let service = MockLocationsService(
            result: .success(LocationsTestData.response.locations)
        )

        let viewModel = LocationsViewModel(locationsService: service)

        await viewModel.loadLocations()

        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsSetsErrorMessageWhenServiceFails() async {
        let service = MockLocationsService(
            result: .failure(.invalidResponse)
        )

        let viewModel = LocationsViewModel(locationsService: service)

        await viewModel.loadLocations()

        #expect(viewModel.locations.isEmpty)
        #expect(viewModel.errorMessage == NetworkError.invalidResponse.errorDescription)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsClearsPreviousErrorBeforeLoading() async {
        let service = MockLocationsService(
            result: .success(LocationsTestData.response.locations)
        )

        let viewModel = LocationsViewModel(locationsService: service)
        viewModel.errorMessage = "Previous error"

        await viewModel.loadLocations()

        #expect(viewModel.errorMessage == nil)
    }
}

private final class MockLocationsService: LocationsServicing, @unchecked Sendable {
    private let result: Result<[PlaceLocation], NetworkError>

    init(result: Result<[PlaceLocation], NetworkError>) {
        self.result = result
    }

    func fetchLocations() async throws -> [PlaceLocation] {
        switch result {
        case .success(let locations):
            return locations
        case .failure(let error):
            throw error
        }
    }
}

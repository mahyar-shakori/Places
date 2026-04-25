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
    func loadLocationsSetsLocationsWhenAPISucceeds() async {
        let apiService = MockAPIService<LocationsResponse>(
            result: .success(LocationsTestData.response)
        )

        let viewModel = LocationsViewModel(apiService: apiService)

        await viewModel.loadLocations()

        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsSetsErrorMessageWhenAPIFails() async {
        let apiService = MockAPIService<LocationsResponse>(
            result: .failure(.invalidResponse)
        )

        let viewModel = LocationsViewModel(apiService: apiService)

        await viewModel.loadLocations()

        #expect(viewModel.locations.isEmpty)
        #expect(viewModel.errorMessage == NetworkError.invalidResponse.errorDescription)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsClearsPreviousErrorBeforeLoading() async {
        let apiService = MockAPIService<LocationsResponse>(
            result: .success(LocationsTestData.response)
        )

        let viewModel = LocationsViewModel(apiService: apiService)
        viewModel.errorMessage = "Previous error"

        await viewModel.loadLocations()

        #expect(viewModel.errorMessage == nil)
    }
}

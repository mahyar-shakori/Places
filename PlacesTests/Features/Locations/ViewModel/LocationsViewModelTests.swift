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
        let repository = MockLocationsRepository(
            result: .success(LocationsTestData.response.locations)
        )

        let viewModel = LocationsViewModel(repository: repository)

        await viewModel.loadLocationsIfNeeded()

        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsSetsErrorMessageWhenAPIFails() async {
        let repository = MockLocationsRepository(
            result: .failure(NetworkError.invalidResponse)
        )

        let viewModel = LocationsViewModel(repository: repository)

        await viewModel.loadLocationsIfNeeded()

        #expect(viewModel.locations.isEmpty == true)
        #expect(viewModel.errorMessage == NetworkError.invalidResponse.errorDescription)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func loadLocationsClearsPreviousErrorBeforeLoading() async {
        let repository = MockLocationsRepository(
            result: .failure(NetworkError.invalidResponse)
        )

        let viewModel = LocationsViewModel(repository: repository)

        await viewModel.loadLocationsIfNeeded()

        #expect(viewModel.errorMessage != nil)

        repository.result = .success(LocationsTestData.response.locations)

        await viewModel.loadLocationsIfNeeded()

        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.isLoading == false)
    }
}

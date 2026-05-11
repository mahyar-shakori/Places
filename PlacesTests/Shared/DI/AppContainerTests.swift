//
//  AppContainerTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct AppContainerTests {

    @Test
    func makeLocationsViewModelCreatesViewModelWithInjectedAPIService() async {
        let mockAPIService = MockAPIService<LocationsResponse>(
            result: .success(LocationsTestData.response)
        )
        let container = AppContainer(apiService: mockAPIService)
        let viewModel = container.makeLocationsViewModel()

        await viewModel.loadLocations()

        #expect(container.apiService is MockAPIService<LocationsResponse>)
        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test
    func makeCustomLocationViewModelCreatesViewModel() {
        let container = AppContainer()

        let viewModel = container.makeCustomLocationViewModel()

        #expect(viewModel.isValidCoordinate == false)
        #expect(viewModel.wikipediaURL == nil)
    }
}

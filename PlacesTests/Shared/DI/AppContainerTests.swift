//
//  AppContainerTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct AppContainerTests: @unchecked Sendable {

    @Test
    func appContainerCreatesDefaultDependencies() {
        let container = AppContainer()

        #expect(container.apiService is APIService)
    }

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
}

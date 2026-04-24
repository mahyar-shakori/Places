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
        #expect(container.locationsService is LocationsService)
    }

    @Test
    func appContainerUsesInjectedAPIServiceForLocationsService() async throws {
        let mockAPIService = MockAPIService<LocationsService.Response>(
            result: .success(LocationsTestData.response)
        )

        let container = AppContainer(apiService: mockAPIService)

        let locations = try await container.locationsService.fetchLocations()

        #expect(container.apiService is MockAPIService<LocationsService.Response>)
        #expect(locations == LocationsTestData.response.locations)
    }

    @MainActor
    @Test
    func makeLocationsViewModelCreatesViewModelWithInjectedDependencies() async {
        let mockAPIService = MockAPIService<LocationsService.Response>(
            result: .success(LocationsTestData.response)
        )

        let container = AppContainer(apiService: mockAPIService)
        let viewModel = container.makeLocationsViewModel()

        await viewModel.loadLocations()

        #expect(viewModel.locations == LocationsTestData.response.locations)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }
}

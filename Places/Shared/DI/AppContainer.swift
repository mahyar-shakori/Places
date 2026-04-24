//
//  AppContainer.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

nonisolated final class AppContainer: @unchecked Sendable {
    let apiService: APIFetching
    let locationsService: LocationsServicing

    init(apiService: APIFetching = APIService()) {
        self.apiService = apiService
        self.locationsService = LocationsService(apiService: apiService)
    }
}

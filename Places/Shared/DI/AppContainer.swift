//
//  AppContainer.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

@Observable
final class AppContainer {
    let apiService: APIFetching

    init(apiService: APIFetching = APIService()) {
        self.apiService = apiService
    }

    func makeLocationsViewModel() -> LocationsViewModel {
        let repository = LocationsRepository(apiService: apiService)
        return LocationsViewModel(repository: repository)
    }

    func makeCustomLocationViewModel() -> CustomLocationViewModel {
        CustomLocationViewModel()
    }
}

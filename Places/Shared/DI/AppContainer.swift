//
//  AppContainer.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

final class AppContainer {
    let apiService: APIFetching

    init(apiService: APIFetching = APIService()) {
        self.apiService = apiService
    }

    func makeLocationsViewModel() -> LocationsViewModel {
        LocationsViewModel(apiService: apiService)
    }

    func makeCustomLocationViewModel() -> CustomLocationViewModel {
        CustomLocationViewModel()
    }
}

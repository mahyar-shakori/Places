//
//  LocationsViewModel.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Observation

@Observable
final class LocationsViewModel {
    private let apiService: APIFetching

    var locations: [PlaceLocation] = []
    var isLoading = false
    var errorMessage: String?
    
    init(apiService: APIFetching) {
        self.apiService = apiService
    }
    
    func loadLocations() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            let request = try LocationsEndpoint.locations.asURLRequest()
            let response: LocationsResponse = try await apiService.fetchData(
                from: request
            )
            locations = response.locations
        } catch let error as LocalizedError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = Localization.NetworkError.invalidResponse
        }
    }
}

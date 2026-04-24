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
            let response = try await apiService.fetchData(
                from: LocationsEndpoint.locations,
                as: LocationsResponse.self
            )
            locations = response.locations
        } catch let error as LocalizedError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = L10n.NetworkError.invalidResponse
        }
    }
}

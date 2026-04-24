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
    private let locationsService: any LocationsServicing

    var locations: [PlaceLocation] = []
    var isLoading = false
    var errorMessage: String?

    init(locationsService: LocationsServicing) {
        self.locationsService = locationsService
    }

    func loadLocations() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            locations = try await locationsService.fetchLocations()
        } catch let error as LocalizedError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = L10n.NetworkError.invalidResponse
        }
    }
}

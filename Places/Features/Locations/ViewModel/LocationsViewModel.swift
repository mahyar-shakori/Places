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
    private let repository: LocationsRepositoryProtocol
    private(set) var locations: [PlaceLocation] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    
    init(repository: LocationsRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadLocationsIfNeeded() async {
        guard locations.isEmpty else {
            return
        }
        await loadLocations()
    }
    
    private func loadLocations() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            locations = try await repository.fetchLocations()
        } catch let error as LocalizedError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = Localization.NetworkError.invalidResponse
        }
    }
}

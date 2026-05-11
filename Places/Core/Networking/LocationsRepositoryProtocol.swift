//
//  LocationsRepositoryProtocol.swift
//  Places
//
//  Created by Mahyar on 11/05/2026.
//

protocol LocationsRepositoryProtocol: Sendable {
    func fetchLocations() async throws -> [PlaceLocation]
}

final class LocationsRepository: LocationsRepositoryProtocol {
    private let apiService: APIFetching
    
    init(apiService: APIFetching) {
        self.apiService = apiService
    }

    func fetchLocations() async throws -> [PlaceLocation] {
        let request = try LocationsEndpoint.locations.asURLRequest()
        let response: LocationsResponse = try await apiService.fetchData(from: request)
        return response.locations
    }
}

//
//  LocationsService.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

nonisolated final class LocationsService: LocationsServicing, @unchecked Sendable {
    struct Response: Decodable {
        let locations: [PlaceLocation]
    }

    private let apiService: APIFetching

    init(apiService: APIFetching) {
        self.apiService = apiService
    }

    func fetchLocations() async throws -> [PlaceLocation] {
        let response: Response = try await apiService.fetchData(
            from: LocationsEndpoint.locations
        )
        return response.locations
    }
}

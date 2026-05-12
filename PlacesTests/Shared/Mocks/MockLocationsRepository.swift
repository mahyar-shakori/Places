//
//  MockLocationsRepository.swift
//  Places
//
//  Created by Mahyar on 12/05/2026.
//

@testable import Places

final class MockLocationsRepository: LocationsRepositoryProtocol, @unchecked Sendable {
    var result: Result<[PlaceLocation], Error>

    init(result: Result<[PlaceLocation], Error>) {
        self.result = result
    }

    func fetchLocations() async throws -> [PlaceLocation] {
        try result.get()
    }
}

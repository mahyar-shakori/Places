//
//  LocationsServicing.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

protocol LocationsServicing: Sendable {
    func fetchLocations() async throws -> [PlaceLocation]
}

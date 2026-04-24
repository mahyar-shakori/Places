//
//  LocationsResponse.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

struct LocationsResponse: Decodable, Sendable {
    let locations: [PlaceLocation]
}

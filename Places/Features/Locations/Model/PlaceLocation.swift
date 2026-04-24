//
//  PlaceLocation.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

nonisolated struct PlaceLocation: Decodable, Equatable {
    let name: String?
    let latitude: Double
    let longitude: Double

    private enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}

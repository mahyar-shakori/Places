//
//  PlaceLocation.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import CoreLocation

nonisolated struct PlaceLocation: Identifiable, Decodable, Equatable {
    let name: String?
    let latitude: Double
    let longitude: Double

    var id: String {
        "\(name ?? "unknown")-\(latitude)-\(longitude)"
    }

    var displayName: String {
        name ?? "Unknown location"
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}

//
//  PlaceLocation.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

struct PlaceLocation: Identifiable, Decodable, Equatable, Sendable {
    let name: String?
    let latitude: Double
    let longitude: Double
    
    var id: String {
        "\(latitude)-\(longitude)"
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}

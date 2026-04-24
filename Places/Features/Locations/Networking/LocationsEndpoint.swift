//
//  LocationsEndpoint.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

nonisolated enum LocationsEndpoint: Endpoint {
    case locations

    private static let locationsURL = URL(
        string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
    )

    var url: URL? {
        switch self {
        case .locations:
            return Self.locationsURL
        }
    }

    var method: HTTPMethod {
        .get
    }
}

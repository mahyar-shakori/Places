//
//  LocationsEndpoint.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

enum LocationsEndpoint: NetworkEndpoint, Sendable {
    case locations

    var baseURL: URL? {
        switch self {
        case .locations:
            return APIConfiguration.baseURL
        }
    }

    var path: String {
        switch self {
        case .locations:
            return "assignment-ios/main/locations.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .locations:
            return .get
        }
    }
}

//
//  WikipediaURLBuilder.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation

enum WikipediaURLBuilder {
    private enum Constants {
        static let scheme = "wikipedia"
        static let host = "places"
        static let latitudeQueryName = "lat"
        static let longitudeQueryName = "long"
    }
    
    static func makeURL(
        latitude: Double,
        longitude: Double
    ) -> URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.queryItems = [
            URLQueryItem(name: Constants.latitudeQueryName, value: "\(latitude)"),
            URLQueryItem(name: Constants.longitudeQueryName, value: "\(longitude)")
        ]
        return components.url
    }
}

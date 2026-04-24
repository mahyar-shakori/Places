//
//  WikipediaURLBuilder.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation

enum WikipediaURLBuilder {
    static func makeURL(
        latitude: Double,
        longitude: Double
    ) -> URL? {
        var components = URLComponents()
        components.scheme = "wikipedia"
        components.host = "places"
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "long", value: "\(longitude)")
        ]
        return components.url
    }
}

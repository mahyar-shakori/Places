//
//  CoordinateDisplayFormatter.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

enum CoordinateDisplayFormatter {
    static func text(
        latitude: Double,
        longitude: Double
    ) -> String {
        "\(latitude), \(longitude)"
    }
}

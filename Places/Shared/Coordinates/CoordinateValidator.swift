//
//  CoordinateValidator.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

enum CoordinateValidator {
    static func coordinate(
        latitude: String,
        longitude: String
    ) -> (latitude: Double, longitude: Double)? {
        guard let latitudeValue = Double(latitude),
              let longitudeValue = Double(longitude),
              (-90...90).contains(latitudeValue),
              (-180...180).contains(longitudeValue) else {
            return nil
        }
        return (latitudeValue, longitudeValue)
    }
}

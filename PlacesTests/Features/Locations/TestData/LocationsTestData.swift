//
//  LocationsTestData.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

@testable import Places

enum LocationsTestData: @unchecked Sendable {
    static let amsterdam = PlaceLocation(
        name: "Amsterdam",
        latitude: 52.3547498,
        longitude: 4.8339215
    )

    static let madridWithoutName = PlaceLocation(
        name: nil,
        latitude: 40.4380638,
        longitude: -3.7495758
    )

    static let locations = [
        amsterdam,
        madridWithoutName
    ]

    static let response = LocationsResponse(
        locations: locations
    )
}

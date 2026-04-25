//
//  PlaceLocationTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct PlaceLocationTests {
    
    @Test
    func decodesFromJSONCorrectly() throws {
        let json = """
        {
            "name": "Amsterdam",
            "lat": 52.3547,
            "long": 4.8339
        }
        """.data(using: .utf8)!
        
        let location = try JSONDecoder().decode(PlaceLocation.self, from: json)
        
        #expect(location.name == "Amsterdam")
        #expect(location.latitude == 52.3547)
        #expect(location.longitude == 4.8339)
    }
    
    @Test
    func decodesWithoutName() throws {
        let json = """
        {
            "lat": 40.0,
            "long": -3.0
        }
        """.data(using: .utf8)!
        
        let location = try JSONDecoder().decode(PlaceLocation.self, from: json)
        
        #expect(location.name == nil)
    }
    
    @Test
    func idIsGeneratedFromCoordinates() {
        let location = PlaceLocation(
            name: "Test",
            latitude: 10.0,
            longitude: 20.0
        )

        #expect(location.id == "10.0-20.0")
    }
}

//
//  CustomLocationViewModel.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Observation

@Observable
final class CustomLocationViewModel {
    var latitude = ""
    var longitude = ""
    
    var isValidCoordinate: Bool {
        coordinate != nil
    }
    
    var coordinate: (latitude: Double, longitude: Double)? {
        guard let latitudeValue = Double(latitude),
              let longitudeValue = Double(longitude),
              (-90...90).contains(latitudeValue),
              (-180...180).contains(longitudeValue)
        else {
            return nil
        }
        return (latitudeValue, longitudeValue)
    }
}

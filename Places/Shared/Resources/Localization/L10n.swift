//
//  L10n.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

//import Foundation
//
//enum L10n {
//    enum Common {
//        static var placesTitle: String { "places.title".localized }
//        static var customLocationTitle: String { "custom.location.title".localized }
//    }
//
//    enum Locations {
//        static var unknownTitle: String { "locations.unknown.title".localized }
//        static var errorTitle: String { "locations.error.title".localized }
//    }
//
//    enum CustomLocation {
//        static var enterCoordinates: String { "custom.enter.coordinates".localized }
//        static var latitudePlaceholder: String { "custom.latitude.placeholder".localized }
//        static var longitudePlaceholder: String { "custom.longitude.placeholder".localized }
//        static var openWikipedia: String { "custom.open.wikipedia".localized }
//        static var howItWorksTitle: String { "custom.how.it.works.title".localized }
//        static var description: String { "custom.description".localized }
//    }
//
//    enum NetworkError {
//        nonisolated static var invalidURL: String { "invalid.url".localized }
//        nonisolated static var invalidResponse: String { "invalid.response".localized }
//        nonisolated static var unacceptableStatusCode: String { "unacceptable.status.code".localized }
//        nonisolated static var decodingFailed: String { "decoding.failed".localized }
//    }
//}


import Foundation

enum L10n {
    enum Common {
        static let placesTitle = String(localized: "places.title")
        static let customLocationTitle = String(localized: "custom.location.title")
    }

    enum Locations {
        static let unknownTitle = String(localized: "locations.unknown.title")
        static let errorTitle = String(localized: "locations.error.title")
    }

    enum CustomLocation {
        static let enterCoordinates = String(localized: "custom.enter.coordinates")
        static let latitudePlaceholder = String(localized: "custom.latitude.placeholder")
        static let longitudePlaceholder = String(localized: "custom.longitude.placeholder")
        static let openWikipedia = String(localized: "custom.open.wikipedia")
        static let howItWorksTitle = String(localized: "custom.how.it.works.title")
        static let description = String(localized: "custom.description")
    }

    enum NetworkError {
        nonisolated static let invalidURL = String(localized: "invalid.url")
        nonisolated static let invalidResponse = String(localized: "invalid.response")
        nonisolated static let unacceptableStatusCode = String(localized: "unacceptable.status.code")
        nonisolated static let decodingFailed = String(localized: "decoding.failed")
    }
    
    enum Wikipedia {
        static let notInstalledTitle = String(localized: "wikipedia.not.installed.title")
        static let notInstalledMessage = String(localized: "wikipedia.not.installed.message")
        static let okButton = String(localized: "common.ok")
    }
    
    enum Accessibility {
        static let north = String(localized: "accessibility.north")
        static let south = String(localized: "accessibility.south")
        static let east = String(localized: "accessibility.east")
        static let west = String(localized: "accessibility.west")
        
        static let locationLabel = String(localized: "accessibility.location.label")
        static let latitudeField = String(localized: "accessibility.latitude.field")
        static let latitudeHint = String(localized: "accessibility.latitude.hint")
        static let longitudeField = String(localized: "accessibility.longitude.field")
        static let longitudeHint = String(localized: "accessibility.longitude.hint")
        
        static let openWikipediaButton = String(localized: "accessibility.open.wikipedia.button")
        static let openWikipediaHint = String(localized: "accessibility.open.wikipedia.hint")
        static let openWikipediaRequirementHint = String(localized: "accessibility.open.wikipedia.requirement.hint")
    }
}

//
//  Localization.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

enum Localization {
    enum Common {
        static let placesTitle = String(localized: "places.title")
        static let customLocationTitle = String(localized: "custom.location.title")
        static let okButton = String(localized: "common.ok")
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

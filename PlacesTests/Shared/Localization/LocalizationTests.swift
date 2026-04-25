//
//  LocalizationTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct LocalizationTests {

    @Test
    func commonStringsAreResolved() {
        expectResolved(Localization.Common.placesTitle, key: "places.title")
        expectResolved(Localization.Common.customLocationTitle, key: "custom.location.title")
        expectResolved(Localization.Common.okButton, key: "common.ok")
    }

    @Test
    func locationsStringsAreResolved() {
        expectResolved(Localization.Locations.unknownTitle, key: "locations.unknown.title")
        expectResolved(Localization.Locations.errorTitle, key: "locations.error.title")
    }

    @Test
    func customLocationStringsAreResolved() {
        expectResolved(Localization.CustomLocation.enterCoordinates, key: "custom.enter.coordinates")
        expectResolved(Localization.CustomLocation.latitudePlaceholder, key: "custom.latitude.placeholder")
        expectResolved(Localization.CustomLocation.longitudePlaceholder, key: "custom.longitude.placeholder")
        expectResolved(Localization.CustomLocation.openWikipedia, key: "custom.open.wikipedia")
        expectResolved(Localization.CustomLocation.howItWorksTitle, key: "custom.how.it.works.title")
        expectResolved(Localization.CustomLocation.description, key: "custom.description")
    }

    @Test
    func networkErrorStringsAreResolved() {
        expectResolved(Localization.NetworkError.invalidURL, key: "invalid.url")
        expectResolved(Localization.NetworkError.invalidResponse, key: "invalid.response")
        expectResolved(Localization.NetworkError.unacceptableStatusCode, key: "unacceptable.status.code")
        expectResolved(Localization.NetworkError.decodingFailed, key: "decoding.failed")
    }

    @Test
    func wikipediaStringsAreResolved() {
        expectResolved(Localization.Wikipedia.notInstalledTitle, key: "wikipedia.not.installed.title")
        expectResolved(Localization.Wikipedia.notInstalledMessage, key: "wikipedia.not.installed.message")
    }

    @Test
    func accessibilityStringsAreResolved() {
        expectResolved(Localization.Accessibility.north, key: "accessibility.north")
        expectResolved(Localization.Accessibility.south, key: "accessibility.south")
        expectResolved(Localization.Accessibility.east, key: "accessibility.east")
        expectResolved(Localization.Accessibility.west, key: "accessibility.west")
        expectResolved(Localization.Accessibility.locationLabel, key: "accessibility.location.label")
        expectResolved(Localization.Accessibility.latitudeField, key: "accessibility.latitude.field")
        expectResolved(Localization.Accessibility.latitudeHint, key: "accessibility.latitude.hint")
        expectResolved(Localization.Accessibility.longitudeField, key: "accessibility.longitude.field")
        expectResolved(Localization.Accessibility.longitudeHint, key: "accessibility.longitude.hint")
        expectResolved(Localization.Accessibility.openWikipediaButton, key: "accessibility.open.wikipedia.button")
        expectResolved(Localization.Accessibility.openWikipediaHint, key: "accessibility.open.wikipedia.hint")
        expectResolved(Localization.Accessibility.openWikipediaRequirementHint, key: "accessibility.open.wikipedia.requirement.hint")
    }
}

private func expectResolved(_ value: String, key: String) {
    #expect(value.isNotEmpty)
    #expect(value != key)
}

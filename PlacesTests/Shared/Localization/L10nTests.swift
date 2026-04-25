//
//  L10nTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

@MainActor
struct L10nTests {

    @Test
    func commonStringsAreResolved() {
        expectResolved(L10n.Common.placesTitle, key: "places.title")
        expectResolved(L10n.Common.customLocationTitle, key: "custom.location.title")
    }

    @Test
    func locationsStringsAreResolved() {
        expectResolved(L10n.Locations.unknownTitle, key: "locations.unknown.title")
        expectResolved(L10n.Locations.errorTitle, key: "locations.error.title")
    }

    @Test
    func customLocationStringsAreResolved() {
        expectResolved(L10n.CustomLocation.enterCoordinates, key: "custom.enter.coordinates")
        expectResolved(L10n.CustomLocation.latitudePlaceholder, key: "custom.latitude.placeholder")
        expectResolved(L10n.CustomLocation.longitudePlaceholder, key: "custom.longitude.placeholder")
        expectResolved(L10n.CustomLocation.openWikipedia, key: "custom.open.wikipedia")
        expectResolved(L10n.CustomLocation.howItWorksTitle, key: "custom.how.it.works.title")
        expectResolved(L10n.CustomLocation.description, key: "custom.description")
    }

    @Test
    func networkErrorStringsAreResolved() {
        expectResolved(L10n.NetworkError.invalidURL, key: "invalid.url")
        expectResolved(L10n.NetworkError.invalidResponse, key: "invalid.response")
        expectResolved(L10n.NetworkError.unacceptableStatusCode, key: "unacceptable.status.code")
        expectResolved(L10n.NetworkError.decodingFailed, key: "decoding.failed")
    }

    @Test
    func wikipediaStringsAreResolved() {
        expectResolved(L10n.Wikipedia.notInstalledTitle, key: "wikipedia.not.installed.title")
        expectResolved(L10n.Wikipedia.notInstalledMessage, key: "wikipedia.not.installed.message")
        expectResolved(L10n.Wikipedia.okButton, key: "common.ok")
    }

    @Test
    func accessibilityStringsAreResolved() {
        expectResolved(L10n.Accessibility.north, key: "accessibility.north")
        expectResolved(L10n.Accessibility.south, key: "accessibility.south")
        expectResolved(L10n.Accessibility.east, key: "accessibility.east")
        expectResolved(L10n.Accessibility.west, key: "accessibility.west")
        expectResolved(L10n.Accessibility.locationLabel, key: "accessibility.location.label")
        expectResolved(L10n.Accessibility.latitudeField, key: "accessibility.latitude.field")
        expectResolved(L10n.Accessibility.latitudeHint, key: "accessibility.latitude.hint")
        expectResolved(L10n.Accessibility.longitudeField, key: "accessibility.longitude.field")
        expectResolved(L10n.Accessibility.longitudeHint, key: "accessibility.longitude.hint")
        expectResolved(L10n.Accessibility.openWikipediaButton, key: "accessibility.open.wikipedia.button")
        expectResolved(L10n.Accessibility.openWikipediaHint, key: "accessibility.open.wikipedia.hint")
        expectResolved(L10n.Accessibility.openWikipediaRequirementHint, key: "accessibility.open.wikipedia.requirement.hint")
    }
}

private func expectResolved(_ value: String, key: String) {
    #expect(value.isNotEmpty)
    #expect(value != key)
}

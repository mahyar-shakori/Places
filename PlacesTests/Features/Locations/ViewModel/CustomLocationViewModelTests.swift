//
//  CustomLocationViewModelTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct CustomLocationViewModelTests {

    @Test
    func validInputEnablesCoordinateAndCreatesWikipediaURL() {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = "52.3676"
        viewModel.longitude = "4.9041"

        #expect(viewModel.isValidCoordinate == true)
        #expect(viewModel.openWikipediaURL?.absoluteString == "wikipedia://places?lat=52.3676&long=4.9041")
        #expect(viewModel.openWikipediaButtonAccessibilityHint == Localization.Accessibility.openWikipediaHint)
    }

    @Test(arguments: [
        ("91", "4.9"),
        ("52.3", "181"),
        ("abc", "4.9"),
        ("", "4.9"),
        ("52.3", "")
    ])
    func invalidInputsDisableCoordinateAndURL(
        latitude: String,
        longitude: String
    ) {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = latitude
        viewModel.longitude = longitude

        #expect(viewModel.isValidCoordinate == false)
        #expect(viewModel.openWikipediaURL == nil)
        #expect(viewModel.openWikipediaButtonAccessibilityHint == Localization.Accessibility.openWikipediaRequirementHint)
    }
}

//
//  CustomLocationViewModelTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

@MainActor
struct CustomLocationViewModelTests {

    @Test
    func coordinateReturnsValuesWhenInputIsValid() {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = "52.3676"
        viewModel.longitude = "4.9041"

        #expect(viewModel.coordinate?.latitude == 52.3676)
        #expect(viewModel.coordinate?.longitude == 4.9041)
        #expect(viewModel.isValidCoordinate == true)
    }

    @Test
    func coordinateReturnsNilWhenLatitudeIsOutOfRange() {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = "91"
        viewModel.longitude = "4.9041"

        #expect(viewModel.coordinate == nil)
        #expect(viewModel.isValidCoordinate == false)
    }

    @Test
    func coordinateReturnsNilWhenLongitudeIsOutOfRange() {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = "52.3676"
        viewModel.longitude = "181"

        #expect(viewModel.coordinate == nil)
        #expect(viewModel.isValidCoordinate == false)
    }

    @Test
    func coordinateReturnsNilWhenInputIsNotNumeric() {
        let viewModel = CustomLocationViewModel()
        viewModel.latitude = "Amsterdam"
        viewModel.longitude = "4.9041"

        #expect(viewModel.coordinate == nil)
        #expect(viewModel.isValidCoordinate == false)
    }
}

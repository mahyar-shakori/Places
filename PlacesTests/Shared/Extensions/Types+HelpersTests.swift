//
//  Types+HelpersTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

struct TypesHelpersTests {

    @Test(arguments: [
        ([1, 2, 3], true),
        ([Int](), false)
    ])
    func isNotEmptyReturnsCorrectValue(
        array: [Int],
        expected: Bool
    ) {
        #expect(array.isNotEmpty == expected)
    }

    @Test(arguments: [
        (true, false),
        (false, true)
    ])
    func boolNotReturnsOppositeValue(
        input: Bool,
        expected: Bool
    ) {
        #expect(input.not == expected)
    }
}

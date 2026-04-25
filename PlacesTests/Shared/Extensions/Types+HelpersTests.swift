//
//  Types+HelpersTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

struct TypesHelpersTests {
    
    @Test
    func isNotEmptyReturnsCorrectValue() {
        #expect([1, 2, 3].isNotEmpty == true)
        #expect([Int]().isNotEmpty == false)
    }
    
    @Test
    func boolNotReturnsOppositeValue() {
        #expect(true.not == false)
        #expect(false.not == true)
    }
}

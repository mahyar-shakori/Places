//
//  HTTPMethodTests.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import Testing
@testable import Places

struct HTTPMethodTests {

    @Test(arguments: [
        (HTTPMethod.get, "GET"),
        (HTTPMethod.post, "POST"),
        (HTTPMethod.put, "PUT"),
        (HTTPMethod.delete, "DELETE"),
        (HTTPMethod.patch, "PATCH")
    ])
    func rawValuesAreCorrect(
        method: HTTPMethod,
        expected: String
    ) {
        #expect(method.rawValue == expected)
    }
}

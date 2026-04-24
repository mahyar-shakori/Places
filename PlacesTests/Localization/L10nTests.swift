//
//  L10nTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

struct L10nTests {

    @MainActor
    @Test
    func networkErrorStringsAreResolved() {
        #expect(!L10n.NetworkError.invalidURL.isEmpty)
        #expect(!L10n.NetworkError.invalidResponse.isEmpty)
        #expect(!L10n.NetworkError.unacceptableStatusCode.isEmpty)
        #expect(!L10n.NetworkError.decodingFailed.isEmpty)

        #expect(L10n.NetworkError.invalidURL != "invalid.url")
        #expect(L10n.NetworkError.invalidResponse != "invalid.response")
        #expect(L10n.NetworkError.unacceptableStatusCode != "unacceptable.status.code")
        #expect(L10n.NetworkError.decodingFailed != "decoding.failed")
    }
}

//
//  HTTPSession.swift
//  Places
//
//  Created by Mahyar on 26/04/2026.
//

import Foundation

protocol HTTPSession: Sendable {
    func data(
        for request: URLRequest
    ) async throws -> (Data, URLResponse)
}

extension URLSession: HTTPSession {}

//
//  MockURLProtocol.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    private static let storage = Storage()

    static func setHandler(
        _ handler: @escaping (URLRequest) throws -> (URLResponse, Data)
    ) {
        storage.handler = handler
    }

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let handler = Self.storage.handler else {
            client?.urlProtocol(
                self,
                didFailWithError: URLError(.badServerResponse)
            )
            return
        }

        do {
            let (response, data) = try handler(request)

            client?.urlProtocol(
                self,
                didReceive: response,
                cacheStoragePolicy: .notAllowed
            )
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private final class Storage: @unchecked Sendable {
    private let lock = NSLock()
    private var handlerValue: ((URLRequest) throws -> (URLResponse, Data))?

    var handler: ((URLRequest) throws -> (URLResponse, Data))? {
        get {
            lock.lock()
            defer { lock.unlock() }
            return handlerValue
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            handlerValue = newValue
        }
    }
}

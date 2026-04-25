//
//  APIServiceTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
@Suite(.serialized)
struct APIServiceTests {

    @Test
    func fetchDataDecodesResponseWhenRequestSucceeds() async throws {
        let data = try #require("""
        {
            "name": "Amsterdam",
            "lat": 52.3547,
            "long": 4.8339
        }
        """.data(using: .utf8))

        MockURLProtocol.setHandler { _ in
            (try makeHTTPResponse(statusCode: 200), data)
        }

        let sut: APIFetching = APIService(
            urlSession: makeMockURLSession()
        )

        let location: PlaceLocation = try await sut.fetchData(
            from: try makeRequest()
        )

        #expect(location.name == "Amsterdam")
        #expect(location.latitude == 52.3547)
        #expect(location.longitude == 4.8339)
    }

    @Test(arguments: [300, 400, 404, 500])
    func fetchDataThrowsUnacceptableStatusCodeWhenStatusCodeIsNotSuccessful(
        statusCode: Int
    ) async throws {
        MockURLProtocol.setHandler { _ in
            (try makeHTTPResponse(statusCode: statusCode), Data())
        }

        let sut: APIFetching = APIService(
            urlSession: makeMockURLSession()
        )

        do {
            let _: PlaceLocation = try await sut.fetchData(
                from: try makeRequest()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .unacceptableStatusCode(statusCode))
        } catch {
            Issue.record("Expected NetworkError.unacceptableStatusCode, got \(error).")
        }
    }

    @Test
    func fetchDataThrowsDecodingFailedWhenJSONIsInvalid() async throws {
        let data = try #require("""
        {
            "invalid": true
        }
        """.data(using: .utf8))

        MockURLProtocol.setHandler { _ in
            (try makeHTTPResponse(statusCode: 200), data)
        }

        let sut: APIFetching = APIService(
            urlSession: makeMockURLSession()
        )

        do {
            let _: PlaceLocation = try await sut.fetchData(
                from: try makeRequest()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .decodingFailed)
        } catch {
            Issue.record("Expected NetworkError.decodingFailed, got \(error).")
        }
    }

    @Test
    func fetchDataThrowsInvalidResponseWhenResponseIsNotHTTPURLResponse() async throws {
        MockURLProtocol.setHandler { _ in
            let response = URLResponse(
                url: try makeURL(),
                mimeType: nil,
                expectedContentLength: 0,
                textEncodingName: nil
            )

            return (response, Data())
        }

        let sut: APIFetching = APIService(
            urlSession: makeMockURLSession()
        )

        do {
            let _: PlaceLocation = try await sut.fetchData(
                from: try makeRequest()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .invalidResponse)
        } catch {
            Issue.record("Expected NetworkError.invalidResponse, got \(error).")
        }
    }

    @Test
    func fetchDataPropagatesURLSessionError() async throws {
        MockURLProtocol.setHandler { _ in
            throw URLError(.notConnectedToInternet)
        }

        let sut: APIFetching = APIService(
            urlSession: makeMockURLSession()
        )

        do {
            let _: PlaceLocation = try await sut.fetchData(
                from: try makeRequest()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as URLError {
            #expect(error.code == .notConnectedToInternet)
        } catch {
            Issue.record("Expected URLError.notConnectedToInternet, got \(error).")
        }
    }
}

// MARK: - Helpers

private func makeMockURLSession() -> URLSession {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.protocolClasses = [MockURLProtocol.self]
    return URLSession(configuration: configuration)
}

private func makeURL() throws -> URL {
    try #require(URL(string: "https://example.com/location"))
}

private func makeRequest() throws -> URLRequest {
    URLRequest(url: try makeURL())
}

private func makeHTTPResponse(
    statusCode: Int
) throws -> HTTPURLResponse {
    try #require(
        HTTPURLResponse(
            url: try makeURL(),
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    )
}

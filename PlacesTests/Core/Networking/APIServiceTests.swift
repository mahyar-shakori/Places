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
        MockURLProtocol.setHandler { request in
            let data = try #require("""
            {
                "name": "Amsterdam",
                "lat": 52.3547498,
                "long": 4.8339215
            }
            """.data(using: .utf8))

            let response = try makeHTTPURLResponse(
                for: request,
                statusCode: 200
            )
            return (response, data)
        }

        let service = APIService(urlSession: makeMockURLSession())

        let location: PlaceLocation = try await service.fetchData(
            from: TestEndpoint()
        )

        #expect(location.name == "Amsterdam")
        #expect(location.latitude == 52.3547498)
        #expect(location.longitude == 4.8339215)
    }

    @Test(arguments: [300, 400, 404, 500])
    func fetchDataThrowsUnacceptableStatusCodeWhenStatusCodeIsNotSuccessful(
        statusCode: Int
    ) async {
        MockURLProtocol.setHandler { request in
            let response = try makeHTTPURLResponse(
                for: request,
                statusCode: statusCode
            )    
            return (response, Data())
        }

        let service = APIService(urlSession: makeMockURLSession())

        do {
            let _: PlaceLocation = try await service.fetchData(
                from: TestEndpoint()
            )
            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .unacceptableStatusCode(statusCode))
        } catch {
            Issue.record("Expected NetworkError.unacceptableStatusCode, got \(error).")
        }
    }

    @Test
    func fetchDataThrowsDecodingFailedWhenJSONIsInvalid() async {
        MockURLProtocol.setHandler { request in
            let data = try #require("""
            {
                "invalid": true
            }
            """.data(using: .utf8))

            let response = try makeHTTPURLResponse(
                for: request,
                statusCode: 200
            )
            return (response, data)
        }

        let service = APIService(urlSession: makeMockURLSession())

        do {
            let _: PlaceLocation = try await service.fetchData(
                from: TestEndpoint()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .decodingFailed)
        } catch {
            Issue.record("Expected NetworkError.decodingFailed, got \(error).")
        }
    }

    @Test
    func fetchDataThrowsInvalidResponseWhenResponseIsNotHTTPURLResponse() async {
        MockURLProtocol.setHandler { _ in
            let url = try #require(URL(string: "https://example.com/location"))

            let response = URLResponse(
                url: url,
                mimeType: nil,
                expectedContentLength: 0,
                textEncodingName: nil
            )
            return (response, Data())
        }

        let service = APIService(urlSession: makeMockURLSession())

        do {
            let _: PlaceLocation = try await service.fetchData(
                from: TestEndpoint()
            )

            Issue.record("Expected fetchData to throw.")
        } catch let error as NetworkError {
            #expect(error == .invalidResponse)
        } catch {
            Issue.record("Expected NetworkError.invalidResponse, got \(error).")
        }
    }
}

private func makeMockURLSession() -> URLSession {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.protocolClasses = [MockURLProtocol.self]
    return URLSession(configuration: configuration)
}

private func makeHTTPURLResponse(
    for request: URLRequest,
    statusCode: Int
) throws -> HTTPURLResponse {
    let url = try #require(request.url)

    return try #require(
        HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    )
}

private struct TestEndpoint: NetworkEndpoint {
    var baseURL: URL? {
        URL(string: "https://example.com")
    }

    var path: String {
        "location"
    }

    var method: HTTPMethod {
        .get
    }
}

//
//  APIServiceTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

@Suite(.serialized)
struct APIServiceTests {

    @Test
    func fetchDataDecodesResponseWhenRequestSucceeds() async throws {
        MockURLProtocol.setHandler { request in
            let data = """
            {
                "name": "Amsterdam",
                "lat": 52.3547498,
                "long": 4.8339215
            }
            """.data(using: .utf8) ?? Data()

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

    @Test
    func fetchDataThrowsUnacceptableStatusCodeWhenStatusCodeIsNotSuccessful() async {
        MockURLProtocol.setHandler { request in
            let response = try makeHTTPURLResponse(
                for: request,
                statusCode: 404
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
            #expect(error == .unacceptableStatusCode(404))
        } catch {
            Issue.record("Expected NetworkError.unacceptableStatusCode, got \(error).")
        }
    }

    @Test
    func fetchDataThrowsDecodingFailedWhenJSONIsInvalid() async {
        MockURLProtocol.setHandler { request in
            let data = """
            {
                "invalid": true
            }
            """.data(using: .utf8) ?? Data()

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

private struct TestEndpoint: Endpoint {
    var url: URL? {
        URL(string: "https://example.com/location")
    }

    var method: HTTPMethod {
        .get
    }
}

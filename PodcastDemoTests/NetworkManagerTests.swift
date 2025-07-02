//
//  NetworkManagerTests.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import XCTest
@testable import PodcastDemo

private extension NetworkManager {
    static func makeStubbed() -> NetworkManager {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: config)
        return NetworkManager(session: session)
    }
}


final class NetworkManagerTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        URLProtocolStub.startInterceptingRequests()
    }

    override class func tearDown() {
        URLProtocolStub.stopInterceptingRequests()
        super.tearDown()
    }
    
    func test_get_onHTTP200_withEmptyJSON() async throws {
        let expected = MockData.emptyHomeResponse
        let data = try JSONEncoder().encode(expected)
        let response  = MockData.sample200HTTPURLResponse
        
        URLProtocolStub.stub(data: data, response: response, error: nil)

        let received = try await NetworkManager.makeStubbed().get(HomeResponse.self,
                                                                  from: .home(page: 1))

        XCTAssertEqual(received.sections.count, expected.sections.count)
    }

    func test_get_onHTTP200_withNonEmptyJSON() async throws {
        let expected = MockData.sampleHomeResponse
        let data = try JSONEncoder().encode(expected)
        let response  = MockData.sample200HTTPURLResponse
        
        URLProtocolStub.stub(data: data, response: response, error: nil)

        let received = try await NetworkManager.makeStubbed().get(HomeResponse.self,
                                                                  from: .home(page: 1))

        XCTAssertEqual(received.sections.count, expected.sections.count)
    }
    
}

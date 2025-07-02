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
    
    func test_get_ServerError_onNon2xx() async {
        let response = MockData.createMockResponse(statusCode: 500)
        URLProtocolStub.stub(data: Data(), response: response, error: nil)

        do {
            _ = try await NetworkManager.makeStubbed().get(HomeResponse.self,
                                                           from: .home(page: 1))
            XCTFail("Expected to throw, but succeeded")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .serverError(500))
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_get_throwsNoData_onEmptyBody() async {
        URLProtocolStub.stub(data: Data(),
                             response: MockData.sample200HTTPURLResponse,
                             error: nil)

        do {
            _ = try await NetworkManager.makeStubbed().get(HomeResponse.self,
                                                           from: .home(page: 1))
            XCTFail("Expected to throw .noData")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .noData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_get_throwsDecodingError_onInvalidJSON() async {
        let badJSON = MockData.invalidJSON.data(using: .utf8) ?? Data()
        URLProtocolStub.stub(data: badJSON,
                             response: MockData.sample200HTTPURLResponse,
                             error: nil)

        do {
            _ = try await NetworkManager.makeStubbed().get(HomeResponse.self,
                                                           from: .home(page: 1))
            XCTFail("Expected to throw .decodingError")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .decodingError)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}

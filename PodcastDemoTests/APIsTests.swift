//
//  NetworkManagerTests.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import XCTest
@testable import PodcastDemo

final class APIsTests: XCTestCase {

    func test_makeURLs_returnsCorrectURLs() throws {
        let homeURL = API.home(page: nil).url
        let homeURLPaging = API.home(page: 1).url
        let searchURL = API.search(query: "podcast", page: 2).url
        
        XCTAssertEqual(homeURL?.absoluteString, "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections")
        XCTAssertEqual(homeURLPaging?.absoluteString, "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections?page=1")
        XCTAssertEqual(searchURL?.absoluteString, "https://mock.apidog.com/m1/735111-711675-default/search?query=podcast&page=2")
    }
}

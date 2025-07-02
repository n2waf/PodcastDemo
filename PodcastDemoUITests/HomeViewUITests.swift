//
//  HomeViewUITests.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import XCTest

final class HomeViewUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testScrollDownAndSwipeHorizontalSection() throws {
        let verticalScroll = app.scrollViews.firstMatch
        XCTAssertTrue(verticalScroll.waitForExistence(timeout: 5))

        for _ in 0..<2 { verticalScroll.swipeUp() }

        let nested = verticalScroll.descendants(matching: .scrollView)

        guard nested.count > 1 else {
            XCTFail("No horizontal sections discovered")
            return
        }

        let randomIndex = Int.random(in: 1..<nested.count)
        let horizontalScroll = nested.element(boundBy: randomIndex)

        horizontalScroll.swipeLeft()
        horizontalScroll.swipeRight()
    }
}

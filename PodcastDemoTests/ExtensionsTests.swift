//
//  ExtensionsTests.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import XCTest
@testable import PodcastDemo

final class ExtensionsTests: XCTestCase {
    
    func testIntToHoursAndMinutes_OnlyMinutes() {
        let duration = 45
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "45 min")
    }
    
    func testIntToHoursAndMinutes_OnlyHours() {
        let duration = 120 // 2 hours
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "2 h")
    }
    
    func testIntToHoursAndMinutes_HoursAndMinutes() {
        let duration = 135 // 2 hours 15 minutes
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "2h 15m")
    }
    
    func testIntToHoursAndMinutes_ZeroDuration() {
        let duration = 0
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "0 min")
    }
    
    func testIntToHoursAndMinutes_OnlyOneMinute() {
        let duration = 1
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "1 min")
    }
    
    func testIntToHoursAndMinutes_MultipleHours() {
        let duration = 600 // 10 hours
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "10 h")
    }
    
    func testIntToHoursAndMinutes_LongDuration() {
        let duration = 1441 // 24 hours 1 minute
        let result = duration.toHoursAndMinutes
        
        XCTAssertEqual(result, "24h 1m")
    }
}

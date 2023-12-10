//
//  WindTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class WindTests: XCTestCase {
    func testWindDecodingSuccess() {
        let jsonString = """
        {
            "speed":3.6,
            "deg":210,
            "gust": 17.6
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let wind = try! JSONDecoder().decode(Wind.self, from: data)
        
        XCTAssertEqual(wind.speed, 3.6)
        XCTAssertEqual(wind.deg, 210)
        XCTAssertEqual(wind.gust, 17.6)
    }
    
    func testWindDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let wind = try! JSONDecoder().decode(Wind.self, from: data)
        
        XCTAssertEqual(wind.speed, 0.0)
        XCTAssertEqual(wind.deg, 0)
        XCTAssertEqual(wind.gust, 0.0)
    }
    
    func testWindDecodingInvalidTypes() {
        let jsonString = """
        {
            "speed":"fgg",
            "deg":"ikj",
            "gust": "sdcg"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let wind = try! JSONDecoder().decode(Wind.self, from: data)
        
        XCTAssertEqual(wind.speed, 0.0)
        XCTAssertEqual(wind.deg, 0)
        XCTAssertEqual(wind.gust, 0.0)
    }
}

//
//  SnowTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class SnowTests: XCTestCase {
    func testSnowDecodingSuccess() {
        let jsonString = """
        {
            "1h": 23.76
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let snow = try! JSONDecoder().decode(Snow.self, from: data)
        
        XCTAssertEqual(snow.h1, 23.76)
    }
    
    func testSnowDecodingMissingKey() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let snow = try! JSONDecoder().decode(Snow.self, from: data)
        
        XCTAssertEqual(snow.h1, 0.0)
    }
    
    func testSnowDecodingInvalidTypes() {
        let jsonString = """
        {
            "1h": "dfghj"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let snow = try! JSONDecoder().decode(Snow.self, from: data)
        
        XCTAssertEqual(snow.h1, 0.0)
    }
}

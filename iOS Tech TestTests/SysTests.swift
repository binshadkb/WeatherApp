//
//  SysTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class SysTests: XCTestCase {
    func testSysDecodingSuccess() {
        let jsonString = """
        {
            "type":2,
            "id":2011528,
            "country":"GB",
            "sunrise":1702021887,
            "sunset":1702050677
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let sys = try! JSONDecoder().decode(Sys.self, from: data)
        
        XCTAssertEqual(sys.type, 2)
        XCTAssertEqual(sys.id, 2011528)
        XCTAssertEqual(sys.country, "GB")
        XCTAssertEqual(sys.sunrise, 1702021887)
        XCTAssertEqual(sys.sunset, 1702050677)
    }
    
    func testSysDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let sys = try! JSONDecoder().decode(Sys.self, from: data)
        
        XCTAssertEqual(sys.type, 0)
        XCTAssertEqual(sys.id, 0)
        XCTAssertEqual(sys.country, "")
        XCTAssertEqual(sys.sunrise, 0)
        XCTAssertEqual(sys.sunset, 0)
    }
    
    func testSysDecodingInvalidTypes() {
        let jsonString = """
        {
            "type": "dff",
            "id": "esrg",
            "country": 67,
            "sunrise": "dfgh",
            "sunset": "rgh"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let sys = try! JSONDecoder().decode(Sys.self, from: data)
        
        XCTAssertEqual(sys.type, 0)
        XCTAssertEqual(sys.id, 0)
        XCTAssertEqual(sys.country, "")
        XCTAssertEqual(sys.sunrise, 0)
        XCTAssertEqual(sys.sunset, 0)
    }
}

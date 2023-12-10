//
//  CoordTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class CoordTests: XCTestCase {
    func testCoordDecodingSuccess() {
        let jsonString = """
        {
            "lon":0.1276,
            "lat":51.5072
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let coord = try! JSONDecoder().decode(Coord.self, from: data)
        
        XCTAssertEqual(coord.lon, 0.1276)
        XCTAssertEqual(coord.lat, 51.5072)
    }
    
    func testCoordDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let coord = try! JSONDecoder().decode(Coord.self, from: data)
        
        XCTAssertEqual(coord.lon, 0.0)
        XCTAssertEqual(coord.lat, 0.0)
    }
    
    func testCoordDecodingInvalidTypes() {
        let jsonString = """
        {
            "lon":"hgfd",
            "lat":"ujhg"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let coord = try! JSONDecoder().decode(Coord.self, from: data)
        
        XCTAssertEqual(coord.lon, 0.0)
        XCTAssertEqual(coord.lat, 0.0)
    }
}

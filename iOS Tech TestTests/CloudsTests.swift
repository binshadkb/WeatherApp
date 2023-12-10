//
//  CloudsTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class CloudsTests: XCTestCase {
    func testCloudsDecodingSuccess() {
        let jsonString = """
        {
            "all":88
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let clouds = try! JSONDecoder().decode(Clouds.self, from: data)
        
        XCTAssertEqual(clouds.all, 88)
    }
    
    func testCloudsDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let clouds = try! JSONDecoder().decode(Clouds.self, from: data)
        
        XCTAssertEqual(clouds.all, 0)
    }
    
    func testCloudsDecodingInvalidTypes() {
        let jsonString = """
        {
            "all": "yghjj"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let clouds = try! JSONDecoder().decode(Clouds.self, from: data)
        
        XCTAssertEqual(clouds.all, 0)
    }
}

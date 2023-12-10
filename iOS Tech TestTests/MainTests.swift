//
//  MainTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class MainTests: XCTestCase {
    func testMainDecodingSuccess() {
        let jsonString = """
        {
            "temp":282.6,
            "feels_like":280.67,
            "temp_min":281.42,
            "temp_max":283.35,
            "pressure":1005,
            "humidity":82,
            "sea_level": 100,
            "grnd_level": 20
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let main = try! JSONDecoder().decode(Main.self, from: data)
        
        XCTAssertEqual(main.temp, 282.6)
        XCTAssertEqual(main.feelsLike, 280.67)
        XCTAssertEqual(main.tempMin, 281.42)
        XCTAssertEqual(main.tempMax, 283.35)
        XCTAssertEqual(main.pressure, 1005)
        XCTAssertEqual(main.humidity, 82)
        XCTAssertEqual(main.seaLevel, 100)
        XCTAssertEqual(main.grndLevel, 20)
    }
    
    func testMainDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let main = try! JSONDecoder().decode(Main.self, from: data)
        
        XCTAssertEqual(main.temp, 0.0)
        XCTAssertEqual(main.feelsLike, 0.0)
        XCTAssertEqual(main.tempMin, 0.0)
        XCTAssertEqual(main.tempMax, 0.0)
        XCTAssertEqual(main.pressure, 0)
        XCTAssertEqual(main.humidity, 0)
        XCTAssertEqual(main.seaLevel, 0)
        XCTAssertEqual(main.grndLevel, 0)
    }
    
    func testMainDecodingInvalidTypes() {
        let jsonString = """
        {
            "temp":"282.6",
            "feels_like":"280.67",
            "temp_min":"281.42",
            "temp_max":"283.35",
            "pressure":"1005",
            "humidity":"82",
            "sea_level": "100",
            "grnd_level": "20"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let main = try! JSONDecoder().decode(Main.self, from: data)
        
        XCTAssertEqual(main.temp, 0.0)
        XCTAssertEqual(main.feelsLike, 0.0)
        XCTAssertEqual(main.tempMin, 0.0)
        XCTAssertEqual(main.tempMax, 0.0)
        XCTAssertEqual(main.pressure, 0)
        XCTAssertEqual(main.humidity, 0)
        XCTAssertEqual(main.seaLevel, 0)
        XCTAssertEqual(main.grndLevel, 0)
    }
}

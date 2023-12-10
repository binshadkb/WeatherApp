//
//  WeatherTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class WeatherTests: XCTestCase {
    
    func testWeatherDecodingSuccess() {
        let jsonString = """
        {
             "id":804,
             "main":"Clouds",
             "description":"overcast clouds",
             "icon":"04n"
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let weather = try! JSONDecoder().decode(Weather.self, from: data)
        
        XCTAssertEqual(weather.id, 804)
        XCTAssertEqual(weather.main, "Clouds")
        XCTAssertEqual(weather.description, "overcast clouds")
        XCTAssertEqual(weather.icon, "04n")
    }
    
    func testWeatherDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let weather = try! JSONDecoder().decode(Weather.self, from: data)
        
        XCTAssertEqual(weather.id, 0)
        XCTAssertEqual(weather.main, "")
        XCTAssertEqual(weather.description, "")
        XCTAssertEqual(weather.icon, "")
    }
    
    func testWeatherDecodingInvalidTypes() {
        let jsonString = """
        {
             "id":"tfg",
             "main":34,
             "description":677,
             "icon":678
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let weather = try! JSONDecoder().decode(Weather.self, from: data)
        
        XCTAssertEqual(weather.id, 0)
        XCTAssertEqual(weather.main, "")
        XCTAssertEqual(weather.description, "")
        XCTAssertEqual(weather.icon, "")
    }
}

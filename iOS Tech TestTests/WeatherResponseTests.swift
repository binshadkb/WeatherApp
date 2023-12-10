//
//  WeatherResponseTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class WeatherResponseTests: XCTestCase {
    func testWeatherResponseDecodingSuccess() {
        let data = MockConstant.mockJson.data(using: .utf8)!
        let weatherResponse = try! JSONDecoder().decode(WeatherResponse.self, from: data)
        
        XCTAssertEqual(weatherResponse.coord?.lon, 0.1276)
        XCTAssertEqual(weatherResponse.weather.count, 1)
        XCTAssertEqual(weatherResponse.base, "stations")
        XCTAssertEqual(weatherResponse.main?.temp, 282.6)
        XCTAssertEqual(weatherResponse.visibility, 10000)
        XCTAssertEqual(weatherResponse.wind?.speed, 3.6)
        XCTAssertEqual(weatherResponse.clouds?.all, 88)
        XCTAssertEqual(weatherResponse.dt, 1702058471)
        XCTAssertEqual(weatherResponse.sys?.type, 2)
        XCTAssertEqual(weatherResponse.timezone, 0)
        XCTAssertEqual(weatherResponse.id, 7302135)
        XCTAssertEqual(weatherResponse.name, "Abbey Wood")
        XCTAssertEqual(weatherResponse.cod, 200)
    }
    
    func testWeatherResponseDecodingMissingKeys() {
        let jsonString = "{}"
        
        let data = jsonString.data(using: .utf8)!
        let weatherResponse = try! JSONDecoder().decode(WeatherResponse.self, from: data)
        
        XCTAssertNil(weatherResponse.coord)
        XCTAssertEqual(weatherResponse.weather.count, 0)
        XCTAssertEqual(weatherResponse.base, "")
        XCTAssertNil(weatherResponse.main)
        XCTAssertEqual(weatherResponse.visibility, 0)
        XCTAssertNil(weatherResponse.wind)
        XCTAssertNil(weatherResponse.clouds)
        XCTAssertEqual(weatherResponse.dt, 0)
        XCTAssertNil(weatherResponse.sys)
        XCTAssertEqual(weatherResponse.timezone, 0)
        XCTAssertEqual(weatherResponse.id, 0)
        XCTAssertEqual(weatherResponse.name, "")
        XCTAssertEqual(weatherResponse.cod, 0)
    }
}

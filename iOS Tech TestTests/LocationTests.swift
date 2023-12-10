//
//  LocationTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class LocationTests: XCTestCase {
    func testLocationInitialization() {
        let latitude = 51.5072
        let longitude = 0.1276
        
        let location = Location(latitude: latitude, longitude: longitude)
        
        XCTAssertEqual(location.latitude, latitude)
        XCTAssertEqual(location.longitude, longitude)
    }
}

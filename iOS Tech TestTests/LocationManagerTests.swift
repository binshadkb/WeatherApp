//
//  LocationManagerTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 08/12/23.
//

import CoreLocation
import XCTest
@testable import iOS_Tech_Test

class LocationManagerTests: XCTestCase {
    
    var locationManager: LocationManagerProtocol!

    override func setUp() {
        super.setUp()
        locationManager = LocationManagerMock()
    }

    override func tearDown() {
        locationManager = nil
        super.tearDown()
    }
    
    
    func testGetCurrentLocationReturnsExpectedLocation() {
        let completionExpectation = expectation(description: "completion block expectation")
        
        locationManager.getLocation() {
            location in
            XCTAssertEqual(location?.latitude, 51.5072)
            XCTAssertEqual(location?.longitude, 0.1276)
            completionExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetCurrentLocationFailure() {
        
    }
}

//
//  ConversionUtilityTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class UtilityTests: XCTestCase {
    
    func testMetersToKilometersSuccess() {
        let meters = 5000
        
        let kilometers = Utility.metersToKilometers(meters)
        
        XCTAssertEqual(kilometers, 5.0)
    }
    
    
    func testMetersToKilometersFailure() {
        let testCaseZero = 0
        let testcaseNegetive = -5000
        
        let resltZero = Utility.metersToKilometers(testCaseZero)
        let resultNegetive = Utility.metersToKilometers(testcaseNegetive)
        
        XCTAssertEqual(resltZero, 0.0)
        XCTAssertEqual(resultNegetive, 0.0)
    }
    
    func testGenerateImageUrlSuccess() {
        let icon = "01d"
        
        let url = Utility.generateImageUrl(icon: icon)
        
        XCTAssertNotNil(url)
        
        XCTAssertEqual(url?.absoluteString, "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}

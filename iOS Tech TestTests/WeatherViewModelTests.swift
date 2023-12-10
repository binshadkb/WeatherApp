//
//  WeatherViewModelTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class WeatherViewModelTests: XCTestCase {
    
    var viewModel: WeatherViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        viewModel = WeatherViewModel(locationManager: LocationManager(), repository: WeatherRepositoryMock())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchWeatherDataSuccess() {
        let viewModel = WeatherViewModel(locationManager: LocationManager(), repository: WeatherRepositoryMock())
        let expectation = self.expectation(description: "Fetch Weather Data")
        
        viewModel.fetchWeatherData {
            XCTAssertNotNil(viewModel.weatherData)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchWeatherDataFailure() {
        let mockRepository = WeatherRepositoryMock()
        mockRepository.shouldReturnError = true
        let viewModel = WeatherViewModel(locationManager: LocationManager(), repository: mockRepository)
        let expectation = self.expectation(description: "Fetch Weather Data")
        
        viewModel.fetchWeatherData {
            XCTAssertNil(viewModel.weatherData)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}

//
//  WeatherRepositoryTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class WeatherRepositoryTests: XCTestCase {
    func testFetchWeatherDataSuccess() {

        let repository = WeatherRepository(apiClient: ApiClientMock(), urlBuilder: URLBuilder())
        let expectation = self.expectation(description: "Fetch Weather Data")

        
        repository.fetchWeatherData(latitude: 51.5072, longitude: 0.1276) { result in
            
            switch result {
            case .success(let weatherResponse):
                
                XCTAssertEqual(weatherResponse.coord?.lon, 0.1276)
                XCTAssertEqual(weatherResponse.coord?.lat, 51.5072)

            case .failure:
                XCTFail("Expected success, but got failure.")
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchWeatherDataFailure() {
        
        let mockAPIClient = ApiClientMock()
        mockAPIClient.shouldReturnError = true
        let repository = WeatherRepository(apiClient: mockAPIClient, urlBuilder: URLBuilder())
        let expectation = self.expectation(description: "Fetch Weather Data")

        repository.fetchWeatherData(latitude: 0.0, longitude: 0.0) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success.")

            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "ApiClientMock")
                XCTAssertEqual((error as NSError).code, 500)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchWeatherDataURLFailure() {
        let mockAPIClient = ApiClientMock()
        mockAPIClient.shouldReturnError = true
        let repository = WeatherRepository(apiClient: mockAPIClient, urlBuilder: URLBuilderMock())
        let expectation = self.expectation(description: "Fetch Weather Data")

        repository.fetchWeatherData(latitude: 0.0, longitude: 0.0) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success.")

            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "URLBuilder")
                XCTAssertEqual((error as NSError).code, 500)
                XCTAssertEqual((error as NSError).userInfo[NSLocalizedDescriptionKey] as? String, "Failed to build URL")
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}

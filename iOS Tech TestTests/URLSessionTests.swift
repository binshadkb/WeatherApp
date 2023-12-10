//
//  URLSessionTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class URLSessionTests: XCTestCase {
    var urlSession: URLSessionProtocol!
    
    override func setUp() {
        super.setUp()
        urlSession = URLSession.shared
    }

    override func tearDown() {
        urlSession = nil
        super.tearDown()
    }
    
    func testURLSessionDataTask() {
        let expectation = XCTestExpectation(description: "URLSessionDataTask")

        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=52.56&lon=0.234&units=metric&appid=2e24c07db3d3e64e0c05810237ac306a")!
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }

        dataTask.resume()

        wait(for: [expectation], timeout: 5.0)
    }
}

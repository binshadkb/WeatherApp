//
//  URLBuilderTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 08/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class URLBuilderTests: XCTestCase {
    var urlBuilder: URLBuilderProtocol!

    override func setUp() {
        super.setUp()
        urlBuilder = URLBuilder()
    }

    override func tearDown() {
        urlBuilder = nil
        super.tearDown()
    }

    func testBuildURL() {
        let baseURL: String = .BASEURL
        let queryItems = [
            URLQueryItem(name: "lat", value: "52"),
            URLQueryItem(name: "lon", value: "0.25")
        ]

        let url = urlBuilder.buildURL(baseURL: baseURL, queryItems: queryItems)

        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "\(baseURL)?lat=52&lon=0.25")
    }
}

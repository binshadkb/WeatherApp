//
//  APIClientTests.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import XCTest
@testable import iOS_Tech_Test

class APIClientTests: XCTestCase {

    func testFetchSuccess() {
        let session = URLSessionMock()
        session.data = try? JSONSerialization.data(withJSONObject: ["key": "value"])
        let apiClient = ApiClient(session: session)
        let url = URL(string: "https://weatherdata.com/api")!
        let expectation = self.expectation(description: "Fetch Data")
        
        apiClient.fetch(dataType: [String: String].self, from: url) {
            result in
            
            switch result {
            case .success(let data):
                XCTAssertEqual(data["key"], "value")

            case .failure:
                XCTFail("Expected success, but got failure.")
            }

            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchFailure() {
        let session = URLSessionMock()
        session.error = NSError(domain: "URLSessionMock", code: 500, userInfo: nil)
        let apiClient = ApiClient(session: session)
        
        let url = URL(string: .BASEURL)!
        let expectation = self.expectation(description: "Fetch Data")
        apiClient.fetch(dataType: [String: String].self, from: url) {
            result in
            
            switch result {
            case .success:
                XCTFail("Expected success, but got failure.")

            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "URLSessionMock")
                XCTAssertEqual((error as NSError).code, 500)
            }

            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

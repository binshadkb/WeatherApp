//
//  URLSessionMock.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import Foundation
@testable import iOS_Tech_Test

class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSessionDataTaskMock(completionHandler: {
            completionHandler(self.data, self.response, self.error)
        })
    }
}

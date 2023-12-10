//
//  URLSessionDataTaskMock.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import Foundation
@testable import iOS_Tech_Test

class URLSessionDataTaskMock: URLSessionDataTask {
    var completionHandler: (() -> Void)?
    
    init(completionHandler: (() -> Void)? = nil) {
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        completionHandler?()
    }
}

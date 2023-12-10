//
//  ApiClientMock.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import UIKit
@testable import iOS_Tech_Test

class ApiClientMock: ApiClientProtocol {
    
    var shouldReturnError = false
    
    func fetch<T>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>) where T : Decodable {
        if shouldReturnError {
            completionHandler(.failure(NSError(domain: "ApiClientMock", code: 500, userInfo: nil)))
        } else {
            let data = MockConstant.mockJson.data(using: .utf8)!
            let weatherResponse = try! JSONDecoder().decode(T.self, from: data)
            completionHandler(.success(weatherResponse))
        }
    }
}

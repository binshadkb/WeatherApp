//
//  URLBuilderMock.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 10/12/23.
//

import Foundation
@testable import iOS_Tech_Test

class URLBuilderMock: URLBuilderProtocol {
    
    func buildURL(baseURL: String, queryItems: [URLQueryItem]) -> URL? {
        return nil
    }
    
    
}

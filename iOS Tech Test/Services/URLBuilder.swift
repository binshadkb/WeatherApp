//
//  URLBuilder.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

class URLBuilder: URLBuilderProtocol {
    func buildURL(baseURL: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems

        return components?.url
    }
}

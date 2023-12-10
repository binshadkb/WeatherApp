//
//  URLBuilderProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

protocol URLBuilderProtocol {
    func buildURL(baseURL: String, queryItems: [URLQueryItem]) -> URL?
}

//
//  URLSessionProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

//
//  ApiClientProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

protocol ApiClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>)
}

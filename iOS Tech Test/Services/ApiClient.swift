//
//  ApiClient.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

class ApiClient: ApiClientProtocol {
    
    var session: URLSessionProtocol
    
    required init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetch<T>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>) where T : Decodable {
        
        session.dataTask(with: url) {
            data, _, error in
            
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            do {
                let json: T = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(json))
            }
            catch {
                print(error)
                completionHandler(.failure(error))
            }
        }.resume()
    }
}

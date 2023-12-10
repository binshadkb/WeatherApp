//
//  MockWeatherRepository.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import Foundation
@testable import iOS_Tech_Test

class WeatherRepositoryMock: WeatherRepositoryProtocol {
    
    internal var urlBuilder: URLBuilderProtocol
    internal var apiClient: ApiClientProtocol
    
    var shouldReturnError = false
    
    init(apiClient: ApiClientProtocol = ApiClientMock(), urlBuilder: URLBuilderProtocol = URLBuilder()) {
        self.apiClient = apiClient
        self.urlBuilder = urlBuilder
    }
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        
        guard let url = urlBuilder.buildURL(baseURL: .BASEURL, queryItems: []) else {
            let error = NSError(domain: "URLBuilder", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to build URL"])
            completion(.failure(error))
            return
        }
        
        if shouldReturnError {
            completion(.failure(NSError(domain: "WeatherRepositoryMock", code: 500, userInfo: nil)))
        }
        else {
            apiClient.fetch(dataType: WeatherResponse.self, from: url)
            { (result: Result<WeatherResponse, Error>) in
                completion(result)
            }
        }
    }
}


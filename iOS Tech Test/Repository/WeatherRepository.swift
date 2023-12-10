//
//  WeatherRepository.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

class WeatherRepository: WeatherRepositoryProtocol {
    
    internal let urlBuilder: URLBuilderProtocol
    internal let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient(), urlBuilder: URLBuilderProtocol = URLBuilder()) {
        self.urlBuilder = urlBuilder
        self.apiClient = apiClient
    }
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {

        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: .APIKEY)
        ]

        guard let url = urlBuilder.buildURL(baseURL: .BASEURL, queryItems: queryItems) else {
            let error = NSError(domain: "URLBuilder", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to build URL"])
            completion(.failure(error))
            return
        }

        apiClient.fetch(dataType: WeatherResponse.self, from: url) { (result: Result<WeatherResponse, Error>) in
                completion(result)
            }
        }
}

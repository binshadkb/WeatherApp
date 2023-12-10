//
//  WeatherRepositoryProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

protocol WeatherRepositoryProtocol {
    var urlBuilder: URLBuilderProtocol { get }
    var apiClient: ApiClientProtocol { get }
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

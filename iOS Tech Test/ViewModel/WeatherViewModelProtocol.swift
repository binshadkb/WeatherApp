//
//  WeatherViewModelProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

protocol WeatherViewModelProtocol {
    var weatherData: WeatherResponse? { get }
    func fetchWeatherData(completion: @escaping () -> Void)
}

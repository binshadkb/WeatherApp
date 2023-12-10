//
//  WeatherViewModel.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

class WeatherViewModel: WeatherViewModelProtocol {
    private let locationManager: LocationManagerProtocol
    private let repository: WeatherRepositoryProtocol
    var weatherData: WeatherResponse?

    init(locationManager: LocationManagerProtocol = LocationManager(),
         repository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.locationManager = locationManager
        self.repository = repository
    }

    func fetchWeatherData(completion: @escaping () -> Void) {
        
        locationManager.getLocation { location in
            
            guard let location = location else {
                return
            }
            
            self.repository.fetchWeatherData(latitude: location.latitude, longitude: location.longitude) { result in
                switch result {
                case .success(let weatherData):
                    self.weatherData = weatherData
                    completion()
                case .failure(let error):
                    print("Error fetching weather data: \(error)")
                    completion()
                }
            }
        }
    }
}

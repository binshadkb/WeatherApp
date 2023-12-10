//
//  ViewController.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 07/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblHighLowTemperature: UILabel!
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblFeelsLike: UILabel!
    @IBOutlet weak var imgCondition: UIImageView!
    
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblUvIndex: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    
    private let viewModel: WeatherViewModelProtocol = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }

    @IBAction func refreshAction(_ sender: Any) {
        fetchData()
    }
    
    /// fetch weather informaton for current location from server
    private func fetchData() {
        viewModel.fetchWeatherData { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    /// update view based on the informaion from server
    private func updateUI() {
        lblLocation.text = viewModel.weatherData?.name
        
        if let temp = viewModel.weatherData?.main?.temp {
            lblTemperature.text = "\(temp)° C"
        }
        
        if let high = viewModel.weatherData?.main?.tempMax, let low = viewModel.weatherData?.main?.tempMin {
            lblHighLowTemperature.text = "High: \(high) - Low: \(low)"
        }
        
        if let icon = viewModel.weatherData?.weather.first?.icon, let url = Utility.generateImageUrl(icon: icon), let data = try? Data(contentsOf: url) {
            
            imgCondition.image = UIImage(data: data)
        }
                
        
        lblCondition.text = viewModel.weatherData?.weather.first?.main
        
        if let feelsLike = viewModel.weatherData?.main?.feelsLike {
            lblFeelsLike.text = "Feels like \(feelsLike)° C"
        }
        
        if let speed = viewModel.weatherData?.wind?.speed {
            lblWind.text = "\(speed)"
        }
        
        if let humidity = viewModel.weatherData?.main?.humidity {
            lblWind.text = "\(humidity)"
        }
        
        if let visibility = viewModel.weatherData?.visibility {
            lblUvIndex.text = "\(Utility.metersToKilometers(visibility))"
        }
        
        if let pressure = viewModel.weatherData?.main?.pressure {
            lblPressure.text = "\(pressure)"
        }
    }
}

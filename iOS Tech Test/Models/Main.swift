//
//  Main.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation


struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = (try? container.decode(Double.self, forKey: .temp)) ?? 0
        feelsLike = (try? container.decode(Double.self, forKey: .feelsLike)) ?? 0
        tempMin = (try? container.decode(Double.self, forKey: .tempMin)) ?? 0
        tempMax = (try? container.decode(Double.self, forKey: .tempMax)) ?? 0
        pressure = (try? container.decode(Int.self, forKey: .pressure)) ?? 0
        humidity = (try? container.decode(Int.self, forKey: .humidity)) ?? 0
        seaLevel = (try? container.decode(Int.self, forKey: .seaLevel)) ?? 0
        grndLevel = (try? container.decode(Int.self, forKey: .grndLevel)) ?? 0
    }
}

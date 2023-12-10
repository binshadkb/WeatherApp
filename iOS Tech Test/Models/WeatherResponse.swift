//
//  WeatherResponse.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct WeatherResponse: Codable {
    let coord: Coord?
    let weather: [Weather]
    let base: String
    let main: Main?
    let visibility: Int
    let wind: Wind?
    let snow: Snow?
    let clouds: Clouds?
    let dt: Int
    let sys: Sys?
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        coord = try? container.decode(Coord.self, forKey: .coord)
        weather = (try? container.decode([Weather].self, forKey: .weather)) ?? []
        base = (try? container.decode(String.self, forKey: .base)) ?? ""
        main = try? container.decode(Main.self, forKey: .main)
        visibility = (try? container.decode(Int.self, forKey: .visibility)) ?? 0
        wind = try? container.decode(Wind.self, forKey: .wind)
        snow = try? container.decodeIfPresent(Snow.self, forKey: .snow)
        clouds = try? container.decode(Clouds.self, forKey: .clouds)
        dt = (try? container.decode(Int.self, forKey: .dt)) ?? 0
        sys = try? container.decode(Sys.self, forKey: .sys)
        timezone = (try? container.decode(Int.self, forKey: .timezone)) ?? 0
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        name = (try? container.decode(String.self, forKey: .name)) ?? ""
        cod = (try? container.decode(Int.self, forKey: .cod)) ?? 0
        
    }
}

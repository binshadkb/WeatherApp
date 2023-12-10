//
//  Wind.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        speed = (try? container.decode(Double.self, forKey: .speed)) ?? 0
        deg = (try? container.decode(Int.self, forKey: .deg)) ?? 0
        gust = (try? container.decode(Double.self, forKey: .gust)) ?? 0
    }
}

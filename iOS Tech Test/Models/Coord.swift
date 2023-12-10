//
//  Coord.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct Coord: Codable {
    let lon: Double
    let lat: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lon = (try? container.decode(Double.self, forKey: .lon)) ?? 0
        lat = (try? container.decode(Double.self, forKey: .lat)) ?? 0
    }
}

//
//  Sys.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = (try? container.decode(Int.self, forKey: .type)) ?? 0
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        country = (try? container.decode(String.self, forKey: .country)) ?? ""
        sunrise = (try? container.decode(Int.self, forKey: .sunrise)) ?? 0
        sunset = (try? container.decode(Int.self, forKey: .sunset)) ?? 0
    }
}

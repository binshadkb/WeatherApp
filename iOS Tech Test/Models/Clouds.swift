//
//  Clouds.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct Clouds: Codable {
    let all: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        all = (try? container.decode(Int.self, forKey: .all)) ?? 0
    }
}

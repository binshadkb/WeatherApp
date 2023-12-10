//
//  Snow.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation


struct Snow: Codable {
    let h1: Double

    enum CodingKeys: String, CodingKey {
        case h1 = "1h"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        h1 = (try? container.decode(Double.self, forKey: .h1)) ?? 0
    }
}

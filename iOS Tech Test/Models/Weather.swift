//
//  Weather.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        main = (try? container.decode(String.self, forKey: .main)) ?? ""
        description = (try? container.decode(String.self, forKey: .description)) ?? ""
        icon = (try? container.decode(String.self, forKey: .icon)) ?? ""
    }
}

//
//  Utilities.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 10/12/23.
//

import Foundation

class Utility {
    static func metersToKilometers(_ meters: Int) -> Double {
        if meters <= 0 {
            return 0.0
        }
        return Double(meters) / 1000.0
    }
    
    static func generateImageUrl(icon: String) -> URL? {
        let url: String = .IMAGEURL + icon + .IMAGEEXT
        return URL(string: url)
    }
}

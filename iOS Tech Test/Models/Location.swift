//
//  Location.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import Foundation

class Location: LocationProtocol {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

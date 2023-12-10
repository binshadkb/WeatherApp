//
//  CLLocation+Extension.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import CoreLocation

extension CLLocation: LocationProtocol {
    var latitude: Double {
        return self.coordinate.latitude
    }
    
    var longitude: Double {
        return self.coordinate.longitude
    }
}

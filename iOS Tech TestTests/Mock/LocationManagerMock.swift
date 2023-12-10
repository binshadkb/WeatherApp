//
//  LocationManagerMock.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 08/12/23.
//

import CoreLocation
@testable import iOS_Tech_Test

class LocationManagerMock: LocationManagerProtocol {
    var shouldFail = false
    weak var delegate: LocationManagerDelegate?
            
    func getLocation(completion: @escaping (CLLocation?) -> Void) {
        
        let location = CLLocation(latitude: 51.5072, longitude: 0.1276)
        completion(location)
    }
}


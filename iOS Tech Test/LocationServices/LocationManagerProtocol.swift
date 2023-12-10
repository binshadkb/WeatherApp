//
//  LocationManagerProtocol.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 08/12/23.
//

import CoreLocation

protocol LocationManagerProtocol: AnyObject {
    var delegate: LocationManagerDelegate? { get set }
    func getLocation(completion: @escaping (CLLocation?) -> Void)
}

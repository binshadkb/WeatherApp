//
//  LocationManagerDelegate.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 10/12/23.
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ manager: LocationManagerProtocol, didUpdateLocations locations: [CLLocation])
    func locationManager(_ manager: LocationManagerProtocol, didFailWithError error: Error)
}

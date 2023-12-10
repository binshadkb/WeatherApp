//
//  LocationManager.swift
//  iOS Tech Test
//
//  Created by Binshad K B on 10/12/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {

    private var locationManager = CLLocationManager()
    private var completion: ((CLLocation?) -> Void)?

    weak var delegate: LocationManagerDelegate?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func getLocation(completion: @escaping (CLLocation?) -> Void) {
        self.completion = completion
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        delegate?.locationManager(self, didUpdateLocations: locations)
        completion?(locations.last)
        completion = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationManager(self, didFailWithError: error)
        completion?(nil)
        completion = nil
    }
}

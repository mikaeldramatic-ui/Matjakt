//
//  LocationManager.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-28.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
    }
    
    func requestLocationPermission() {
       
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation () {
        
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
        }
        
        print("Latitude:", location.coordinate.latitude)
        print("Longitude:", location.coordinate.longitude)
        
    }
    
    func locationManager(_ maanger: CLLocationManager,
                         didFailWithError error: Error) {
        
        print("Location error:", error.localizedDescription)
    }
}

//
//  StoreLocation.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-28.
//

import Foundation
import CoreLocation

struct StoreLocation: Identifiable {
    
    let id = UUID()
    
    let store: Store
    
    let storeName: String
    let city: String
    
    let latitude: Double
    let longitude: Double
    
    let weeklyAdURL: String
    
    var logoName: String {
        
        switch store {
        
        case .ica:
            return "ica_logo"
            
        case .coop:
            return "coop_logo"
            
        case .willys:
            return "willys_logo"
        }
    }
    
    func distance(from userLocation: CLLocation) -> Double {
     
        let storeLocation = CLLocation(
            latitude: latitude,
            longitude: longitude
        )
        
        return storeLocation.distance(from: userLocation)
        
    }
}



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

extension StoreLocation {
    
    static let mockStores: [StoreLocation] = [
        
        StoreLocation(
            store: .willys,
            storeName: "Willys Alingsås",
            latitude: 57.9308,
            longitude: 12.5331,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        
        StoreLocation(
            store: .ica,
            storeName: "ICA Maxi Alingsås",
            latitude: 57.9260,
            longitude: 12.5338,
            weeklyAdURL: "https://www.ica.se/erbjudanden/maxi-ica-stormarknad-alingsas-1003647/"
        ),
        
        StoreLocation(
            store: .coop,
            storeName: "Coop Alingsås",
            latitude: 57.9215,
            longitude: 12.5360,
            weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-alingsas/"
        )
    ]
}

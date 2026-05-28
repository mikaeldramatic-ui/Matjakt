//
//  StoreLocation.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-28.
//

import Foundation

struct StoreLocation: Identifiable {
    
    let id = UUID()
    let storeName: String
    let latitude: Double
    let longitude: Double
    let weeklyAdURL: String
}

extension StoreLocation {
    
    static let mockStores: [StoreLocation] = [
        
        StoreLocation(
            storeName: "Willys Alingsås",
            latitude: 57.9308,
            longitude: 12.5331,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        
        StoreLocation(
            storeName: "ICA Maxi Alingsås",
            latitude: 57.9260,
            longitude: 12.5338,
            weeklyAdURL: "https://www.ica.se/erbjudanden/maxi-ica-stormarknad-alingsas-1003647/"
        ),
        
        StoreLocation(
            storeName: "Coop Alingsås",
            latitude: 57.9215,
            longitude: 12.5360,
            weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-alingsas/"
        )
    ]
}

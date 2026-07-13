//
//  MockStores.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-07-13.
//

import Foundation


extension StoreLocation {
    
    static let mockStores: [StoreLocation] = [
        
        // MARK: - Willys
        
        StoreLocation(
            store: .willys,
            storeName: "Willys Alingsås",
            city: "Alingsås",
            latitude: 57.9308,
            longitude: 12.5331,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        
        StoreLocation(
            store: .willys,
            storeName: "Willys Gamlestaden",
            city: "Göteborg",
            latitude: 57.743318,
            longitude: 12.009491,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        
        StoreLocation(
            store: .willys,
            storeName: "Willys Partille",
            city: "Partille",
            latitude: 57.739977,
            longitude: 12.107200,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        
        StoreLocation(
            store: .willys,
            storeName: "Willys Vårgårda",
            city: "Vårgårda",
            latitude: 58.0321074,
            longitude: 12.8049594,
            weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
        ),
        

        

        
        // MARK: - ICA
        
        StoreLocation(
            store: .ica,
            storeName: "ICA Maxi Alingsås",
            city: "Alingsås",
            latitude: 57.9260,
            longitude: 12.5338,
            weeklyAdURL: "https://www.ica.se/erbjudanden/maxi-ica-stormarknad-alingsas-1003647/"
        ),
        
        StoreLocation(
            store: .ica,
            storeName: "ICA Kvantum Lerum",
            city: "Lerum",
            latitude: 57.750860,
            longitude: 12.246270,
            weeklyAdURL: "https://www.ica.se/erbjudanden/ica-kvantum-lerum-1003383/"
        ),
        
        StoreLocation(
            store: .ica,
            storeName: "ICA Maxi Stormarknad Partille",
            city: "Partille",
            latitude: 57.736715,
            longitude: 12.105563,
            weeklyAdURL: "https://www.ica.se/erbjudanden/maxi-ica-stormarknad-partille-1004365/"
        ),
        
        StoreLocation(
            store: .ica,
            storeName: "ICA Kvantum Vårgårda",
            city: "Vårgårda",
            latitude: 58.039074,
            longitude: 12.805296,
            weeklyAdURL: "https://www.ica.se/erbjudanden/ica-kvantum-vargarda-1131001/"
        ),
        
        // MARK: - Coop
        
        StoreLocation(
            store: .coop,
            storeName: "Coop Alingsås",
            city: "Alingsås",
            latitude: 57.9215,
            longitude: 12.5360,
            weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-alingsas/"
        ),
        
        StoreLocation(
            store: .coop,
            storeName: "Coop Friggagatan",
            city: "Göteborg",
            latitude: 57.710725,
            longitude: 11.986519,
            weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-friggagatan/"
        ),
        
        StoreLocation(
            store: .coop,
            storeName: "Coop Partille",
            city: "Partille",
            latitude: 57.740722,
            longitude: 12.122307,
            weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-partille/"
        )
    ]
}

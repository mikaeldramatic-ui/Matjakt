//
//  StorePrice.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import Foundation

struct StorePrice: Identifiable {
    let id = UUID()
    let store: Store
    let price: Double
}

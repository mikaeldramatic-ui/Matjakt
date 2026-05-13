//
//  StorePrice.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import Foundation

struct StorePrice: Identifiable, Codable {
    var id = UUID()
    let store: Store
    let price: Double
}

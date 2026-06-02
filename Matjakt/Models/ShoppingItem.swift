//
//  ShoppingItem.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import Foundation

struct ShoppingItem: Identifiable, Codable {
    
    var id = UUID()
    let product: Product
    let store: Store
    
    var isChecked: Bool = false
}

//
//  ShoppingItem.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import Foundation

struct ShoppingItem: Identifiable {
    
    let id = UUID()
    let product: Product
    var isChecked: Bool = false
}

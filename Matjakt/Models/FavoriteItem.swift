//
//  FavoriteItem.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import Foundation

struct FavoriteItem: Identifiable, Codable {
    
    var id = UUID()
    
    let product: Product
}

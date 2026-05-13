//
//  Product.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import Foundation

struct Product: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let ean: String
    let brand: String
    let imageURL: String?
    
    var prices: [StorePrice]
}

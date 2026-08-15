//
//  PreviewData.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-08-15.
//

import Foundation


enum PreviewData {
    
    static let pepsi = Product(
        id: UUID(),
        name: "Pepsi Max 1.5L",
        ean: "123456789",
        brand: "Pepsi",
        imageURL: nil,
        prices: [
            StorePrice(store: .ica, price: 19.50),
            StorePrice(store: .coop, price: 19.95),
            StorePrice(store: .ica, price: 19.90),
        ]
    )
    
    static let mjolk = Product(
        id: UUID(),
        name: "Arla Standardmjölk 1L",
        ean: "2233445566",
        brand: "Arla",
        imageURL: nil,
        prices: [
            StorePrice(store: .ica, price: 17.90),
            StorePrice(store: .coop, price: 18.50),
            StorePrice(store: .ica, price: 16.90),
        ]
    )
    
    static let marabou = Product(
        id: UUID(),
        name: "Marabou Mjölkchoklad 200g",
        ean: "9988776655",
        brand: "Marabou",
        imageURL: nil,
        prices: [
            StorePrice(store: .ica, price: 24.90),
            StorePrice(store: .coop, price: 25.90),
            StorePrice(store: .ica, price: 22.90),
        ]
    )
}

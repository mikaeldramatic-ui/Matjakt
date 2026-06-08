//
//  FavoriteViewModel.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import SwiftUI
import Combine


class FavoriteViewModel: ObservableObject {
    
    @Published var items: [FavoriteItem] = []
    
    private let saveKey = "favorite_items"
    
    init() {
        loadItems()
    }
    
    func addProduct(_ product: Product) {
        
        guard !items.contains(where: {
            $0.product.id == product.id
        }) else {
            return
        }
        
        let item = FavoriteItem(product: product)
        
        items.append(item)
        
        saveItems()
        
    }
    
    func isFavorite(_ product: Product) -> Bool {
        
        items.contains {
            $0.product.id == product.id
        }
    }
    
    func toggleFavorite(_ product: Product) {
        
        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {
            items.remove(at: index)
            
        } else {
            items.append(
                FavoriteItem(product: product)
            )
        }
    }
    
    func removeItem (_ item: FavoriteItem) {
        
        items.removeAll { $0.id == item.id }
        
        saveItems()
        
    }
    
    private func saveItems() {
        
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadItems() {
        
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([FavoriteItem].self, from: data)
        else {
            return
        }
        
        items = decoded
    }
}

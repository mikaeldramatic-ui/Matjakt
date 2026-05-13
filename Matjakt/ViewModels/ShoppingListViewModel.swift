//
//  ShoppingListViewModel.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI
import Combine

class ShoppingListViewModel: ObservableObject {
    
    @Published var items: [ShoppingItem] = []
    
    private let saveKey = "shopping_items"
    init() {
        loadItems()
    }
    
    func addProduct(_ product: Product) {
        
        let item = ShoppingItem(product: product)
        items.append(item)
        
        saveItems()
    }
    
    func toggleItem(_ item: ShoppingItem) {
        
        if let index = items.firstIndex(where:{ $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
        
        saveItems()
    }
    
    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        
        saveItems()
    }
    
    private func saveItems() {
        
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadItems() {
        
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([ShoppingItem].self, from: data) else {
            return
        }
        
        items = decoded
    }
}

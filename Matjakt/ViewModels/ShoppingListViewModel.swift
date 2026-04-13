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
    
    func addProduct(_ product: Product) {
        
        let item = ShoppingItem(product: product)
        items.append(item)
    }
    
    func toggleItem(_ item: ShoppingItem) {
        
        if let index = items.firstIndex(where:{ $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

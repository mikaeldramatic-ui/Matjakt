//
//  ShoppingListView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct ShoppingListView: View {
    
    @StateObject var viewModel = ShoppingListViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(viewModel.items) { item in
                    
                    HStack {
                        
                        Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                        
                        Text(item.product.name)
                    }
                    .onTapGesture {
                        viewModel.toggleItem(item)
                    }
                }
                .onDelete(perform: viewModel.removeItem)
            }
            .navigationTitle("Inköpslista")
        }
    }
}

#Preview {
    ShoppingListView()
}

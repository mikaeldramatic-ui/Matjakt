//
//  ShoppingListView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct ShoppingListView: View {
    
    @EnvironmentObject var viewModel: ShoppingListViewModel
    
    private var groupedItems: [Store: [ShoppingItem]] {
        Dictionary(grouping: viewModel.items) { $0.store }
    }
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach (Store.allCases, id: \.self) { store in
                
                    if let items = groupedItems[store], !items.isEmpty {
                        
                        Section(store.rawValue) {
                            
                            ForEach(items) { item in
                           
                                HStack {
                            
                                    Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                    
                                    Text(item.product.name)
                                }
                                .onTapGesture {
                                    viewModel.toggleItem(item)
                                }
                                .swipeActions {
                                    
                                    Button(role: .destructive) {
                                        viewModel.removeItem(item)
                                    } label: {
                                        Label("Ta bort", systemImage: "trash")
                                    }
                                }
                            }
                            //.onDelete(perform: viewModel.removeItem)
                        }
                    }
                }
            }
            .navigationTitle("Inköpslista")
        }
    }
}

#Preview {
    ShoppingListView()
        .environmentObject(ShoppingListViewModel())
}

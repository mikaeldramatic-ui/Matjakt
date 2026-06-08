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
    
    private func totalPrice(for items: [ShoppingItem]) -> Double {
        items.reduce(0) { $0 + $1.selectedPrice }
    }
    
    private var grandTotal: Double {
        viewModel.items.reduce(0) { $0 + $1.selectedPrice}
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
                                    
                                    Spacer()
                                    
                                    Text("\(item.selectedPrice, specifier: "%.2f") kr")
                                        .fontWeight(.semibold)
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
                            
                            HStack {
                                
                                Text("Totalt")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("\(totalPrice(for: items), specifier: "%.2f") kr")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                
                Section {
                    
                    HStack {
                        
                        Text("Totalt inköp")
                            .font(AppFonts.heading)
                        
                        Spacer()
                        
                        Text("\(grandTotal, specifier: "%.2f") kr")
                            .font(AppFonts.heading)
                            .fontWeight(.bold)
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

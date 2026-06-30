//
//  FavoriteListView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import SwiftUI

struct FavoriteListView: View {
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    private func cheapestPrice(for product: Product) -> StorePrice? {
        product.prices.min { $0.price < $1.price }
    }
    
    var body: some View {
        
        List {
            
            ForEach(favoriteViewModel.items) { item in
            
                HStack(alignment: .top) {
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(AppColors.primary)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text(item.product.name)
                            .font(AppFonts.heading)
                        
                        if let cheapest = cheapestPrice(for: item.product) {
                            
                            Label("Billigast idag", systemImage: "crown.fill")
                                .font(AppFonts.caption)
                                .foregroundStyle(AppColors.primary)
                            
                            Text("\(cheapest.price, specifier: "%.2f") kr * \(cheapest.store.rawValue)")
                                .font(AppFonts.body)
                        }
                    }
                    
                    Spacer()
                }
                .swipeActions {
                    
                    Button(role: .destructive) {
                        favoriteViewModel.removeItem(item)
                    } label: {
                        Label("Ta bort", systemImage: "trash")
                    }
                }
            }
        }
        .navigationTitle("Favoriter")
    }
}

#Preview {
    FavoriteListView()
        .environmentObject(FavoriteViewModel())
}

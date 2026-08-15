//
//  FavoriteCard.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-08-15.
//

import SwiftUI

struct FavoriteCard: View {

    let item: FavoriteItem
    
    private var cheapestPrice: Double? {
        item.product.prices.map (\.price).min()
    }
    
    private var cheapestStore: StorePrice? {
        item.product.prices.min(by: { $0.price < $1.price})
    }
    
    var body: some View {
        
        HStack(spacing: AppSpacing.medium) {
            
            Image(systemName: "heart.fill")
                .font(.title2)
                .foregroundStyle(AppColors.primary)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                
                Text(item.product.name)
                    .font(AppFonts.caption)
                    .fontWeight(.semibold)
                
                Text(item.product.brand)
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.secondaryText)
                
                if let cheapestPrice,
                   let cheapestStore {
                    
                    Label("Billigast idag", systemImage: "crown.fill")
                        .font(AppFonts.caption)
                        .foregroundStyle(AppColors.primary)
                    
                    Text("\(cheapestPrice.formatted(.number.precision(.fractionLength(2)))) kr hos \(cheapestStore.store.rawValue)")
                        .font(AppFonts.heading)
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(AppColors.cardBackground)
        .clipShape(
            RoundedRectangle(cornerRadius: AppCornerRadius.card)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 4,
            y: 2
        )
    }
    
    
}

#Preview("Favoritkort") {
    FavoriteCard(
        item: FavoriteItem(
            product: PreviewData.pepsi
        )
    )
    .padding()
}

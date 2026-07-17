//
//  ProductSearchCard.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-07-17.
//

import SwiftUI

struct ProductSearchCard: View {
    
    let product: Product
    
    var cheapestPrice: Double? {
        product.prices.map(\.price).min()
    }
    
    var body: some View {
        
        HStack(spacing: AppSpacing.medium) {
            
            Image(systemName: "shippingbox.fill")
                .font(.title2)
                .foregroundStyle(AppColors.primary)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                
                Text(product.name)
                    .font(AppFonts.body)
                    .fontWeight(.semibold)
                
                Text(product.brand)
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.secondaryText)
                
                if let cheapestPrice {
                    
                    Text("Från \(cheapestPrice.formatted(.number.precision(.fractionLength(2)))) kr")
                        .font(AppFonts.caption)
                        .foregroundStyle(AppColors.primary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
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

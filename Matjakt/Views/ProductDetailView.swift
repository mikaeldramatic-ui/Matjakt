//
//  ProductDetailView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    private var cheapestPrice: Double? {
        product.prices.map(\.price).min()
    }
    
    private var productHeader: some View {
        
        VStack(spacing: AppSpacing.small) {
            
            Image(systemName: "shippingbox.fill")
                .font(.system(size: 48))
                .foregroundStyle(AppColors.primary)
            
            Text(product.name)
                .font(AppFonts.heading)
                .multilineTextAlignment(.center)
            
            Text(product.brand)
                .font(AppFonts.body)
                .foregroundStyle(AppColors.secondaryText)
            
            if let cheapestPrice {
                
                Text("Från \(cheapestPrice.formatted(.number.precision(.fractionLength(2)))) kr")
                    .font(AppFonts.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(AppColors.primary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
    
    var body: some View {
        
        List {
            
            Section {
                
                productHeader
            }
            
            Section("Butikspriser") {
                
                ForEach(product.prices) { price in
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            HStack(spacing: AppSpacing.small) {
                                
                                Text(price.store.rawValue)
                                    .font(AppFonts.heading)
                                    .fontWeight(.semibold)
                                
                                if price.price == cheapestPrice {
                                    Image(systemName: "crown.fill")
                                        .foregroundStyle(AppColors.primary)
                                }
                            }
                            
                            Text("\(price.price, specifier: "%.2f") kr")
                                .font(AppFonts.body)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        
                        Button("Lägg till") {
                            shoppingListViewModel.addProduct(
                                product,
                                store: price.store,
                                selectedPrice: price.price
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(AppColors.primary)
                    }
                    .padding(.vertical, AppSpacing.small)
                }
            }
        }
            .toolbar {
                
                Button {
                    
                    favoriteViewModel.toggleFavorite(product)
                    
                } label: {
                    
                    Image(
                        systemName:
                            favoriteViewModel.isFavorite(product)
                          ? "heart.fill"
                          : "heart"
                    )
                }
            }
            .navigationTitle(product.name)
        }
    }

    #Preview {
        ProductDetailView(
            product: PreviewData.pepsi
            )
        .environmentObject(ShoppingListViewModel())
        .environmentObject(FavoriteViewModel())
    }

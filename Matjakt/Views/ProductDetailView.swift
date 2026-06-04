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
    
    private var cheapestPrice: Double? {
        product.prices.map(\.price).min()
    }
    
    var body: some View {
        
        List {
    
            Section("Butikspriser") {
                
                ForEach(product.prices) { price in
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                            
                            Text(price.store.rawValue)
                            
                            if price.price == cheapestPrice {
                                Image(systemName: "crown.fill")
                            }
                        }
                            
                            Text("\(price.price, specifier: "%.2f") kr")
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
                    }
                }
            }
        }
        .navigationTitle(product.name)
    }
}


#Preview {
  ProductDetailView(
    product: Product(
        id: UUID(),
        name: "Pepsi",
        ean: "123",
        brand: "Pepsi",
        imageURL: nil,
        prices: []
    )
  )
  .environmentObject(ShoppingListViewModel())
}

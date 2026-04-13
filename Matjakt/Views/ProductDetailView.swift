//
//  ProductDetailView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        
        List {
            
            Section("Butikspriser") {
                
                ForEach(product.prices) { price in
                    
                    HStack {
                        
                        Text(price.store.rawValue)
                        
                        Spacer()
                        
                        Text("\(price.price, specifier: "%.2f") kr")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        .navigationTitle(product.name)
    }
}


//#Preview {
  //  ProductDetailView()
//}

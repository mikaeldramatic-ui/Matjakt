//
//  SearchView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.filteredProducts) { product in
                
                NavigationLink {
                    ProductDetailView(product: product)
                    
                } label: {
                    
                    VStack(alignment: .leading) {
                        
                        Text(product.name)
                            .font(.headline)
                        
                        Text(product.brand)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Matjakt")
            .searchable(text: $viewModel.searchText,
                        prompt: "Sök produkt")
        }
      }
    }

#Preview {
    SearchView()
}

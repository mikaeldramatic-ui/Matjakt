//
//  SearchView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = ProductViewModel()
    @State private var recentSearches = [
        "Pepsi Max",
        "Mjölk",
        "Marabou"
    ]
    
    var body: some View {
        
        NavigationStack {
            
            if viewModel.searchText.isEmpty {
                
                List {
                    
                    Section("Tidigare sökningar") {
                        
                        ForEach(recentSearches, id: \.self) { search in
                            
                            Button(search) {
                                viewModel.searchText = search
                            }
                        }
                    }
                }
                
            } else {
                
                ScrollView {

                    LazyVStack(spacing: AppSpacing.medium) {

                        ForEach(viewModel.filteredProducts) { product in

                            NavigationLink {

                                ProductDetailView(product: product)

                            } label: {

                                ProductSearchCard(product: product)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, AppSpacing.large)
                }
            }
        }
            .navigationTitle("Matjakt")
            .searchable(text: $viewModel.searchText,
                        prompt: "Sök produkt")
        }
      }
#Preview {
    SearchView()
}

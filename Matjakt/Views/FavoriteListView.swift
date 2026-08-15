//
//  FavoriteListView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import SwiftUI

struct FavoriteListView: View {
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {

        ScrollView {

            LazyVStack(spacing: AppSpacing.medium) {

                ForEach(favoriteViewModel.items) { item in

                    NavigationLink {

                        ProductDetailView(
                            product: item.product
                        )

                    } label: {

                        FavoriteCard(item: item)
                    }
                    .buttonStyle(.plain)
                    .contextMenu {

                        Button(role: .destructive) {
                            favoriteViewModel.removeItem(item)
                        } label: {
                            Label("Ta bort", systemImage: "trash")
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, AppSpacing.medium)
        }
        .navigationTitle("Favoriter")
    }
}

#Preview {
    FavoriteListView()
        .environmentObject(FavoriteViewModel())
}

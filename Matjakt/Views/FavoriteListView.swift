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
        
        List {
            
            ForEach(favoriteViewModel.items) { item in
            
                Text(item.product.name)
            }
        }
        .navigationTitle("Favoriter")
    }
}

#Preview {
    FavoriteListView()
        .environmentObject(FavoriteViewModel())
}

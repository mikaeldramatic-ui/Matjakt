//
//  MainTabView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-13.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            
            SearchView()
                .tabItem {
                    Label("Sök", systemImage: "magnifyingglass")
                }
            
            ScannerView()
                .tabItem {
                    Label("Scanner", systemImage: "barcode.viewfinder")
                }
            
            ShoppingListView()
                .tabItem {
                    Label("Lista", systemImage: "cart")
                }
            HomeView()
                .tabItem {
                    Label("Hem", systemImage: "house")

                }
        }
    }
}



//
//  MatjaktApp.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-04-13.
//

import SwiftUI

@main
struct MatjaktApp: App {
    
    @StateObject var shoppingListViewModel = ShoppingListViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(shoppingListViewModel)
        }
    }
}

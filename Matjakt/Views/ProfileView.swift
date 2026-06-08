//
//  ProfileView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("weeklyAdsNotifications")
    private var weeklyAdsNotifications = true
    
    @AppStorage("favoriteDealsNotifications")
    private var favoriteDealsNotifications = true
    
    var body: some View {
        
        NavigationStack {
          
            List {
                
                Section ("Favoriter") {
                    
                    NavigationLink {
                        
                        FavoriteListView()
                        
                    } label: {
                        
                        Label(
                            "Favoritprodukter",
                            systemImage: "heart"
                        )
                    }
                }
                
                Section ("Notiser") {
                    
                    Toggle("Veckoblad uppdaterade",
                           isOn: $weeklyAdsNotifications
                           )
                    
                    Toggle("Erbjudande på favoriter",
                           isOn: $favoriteDealsNotifications
                    )
                }
                
                Section ("Support") {
                    
                    Label(
                        "Kontakta oss",
                        systemImage: "envelope"
                    )
                    NavigationLink {
                        
                        AboutView()
                    } label: {
                        
                        Label(
                            "Om Matjakt",
                            systemImage: "info.circle"
                        )
                    }
                }
            }
        }
            .navigationTitle("Profile")
        }
    }

#Preview {
    ProfileView()
}

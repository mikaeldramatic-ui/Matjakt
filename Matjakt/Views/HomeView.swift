//
//  HomeView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-14.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {

        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    Text("Veckans erbjudanden")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            
                            ForEach(StoreLocation.mockStores) { store in
                            
                                WeeklyAdCard(
                                    storeName: store.storeName,
                                    imageName: "cart.fill",
                                    weeklyAdURL: store.weeklyAdURL
                                )
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Matjakt")
            .onAppear {
                
                locationManager.requestLocationPermission()
                
                locationManager.requestLocation()
            }
        }
    }
}

#Preview {
    HomeView()
}

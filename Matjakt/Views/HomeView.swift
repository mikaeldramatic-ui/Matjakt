//
//  HomeView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-14.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var locationManager = LocationManager()
    @State private var lastUpdated: Date?
    
    private var nearbyStores: [StoreLocation] {
        
        guard let userLocation = locationManager.userLocation else {
            return Array (StoreLocation.mockStores.prefix(3))
        }
        
        return Array (
            StoreLocation.mockStores
                .sorted {
            $0.distance(from: userLocation) <
            $1.distance(from: userLocation)
        }
                .prefix(3)
            )
    }
    
    private func distanceText(for store: StoreLocation) -> String {
        
        guard let userLocation = locationManager.userLocation else {
            return "Okänd"
        }
        
        let distance = store.distance(from: userLocation)
        
        if distance < 1000 {
            return "\(Int(distance)) m bort"
        } else {
            return String(format: "%.1f km bort", distance / 1000)
        }
    }
    
    private func refreshStores() async {
        
        locationManager.requestLocationPermission()
        locationManager.requestLocation()
        
        lastUpdated = Date()
    }
    
    var body: some View {

        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppSpacing.large) {
                    
                    if let lastUpdated {
                            Label(
                                "Senast uppdaterad \(lastUpdated.formatted(date: .omitted,time: .shortened))",
                                systemImage: "clock.arrow.circlepath"
                            )
                            .font(AppFonts.caption)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                        }
                    
                    Text("Veckans erbjudanden")
                        .font(AppFonts.sectionTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: AppSpacing.medium) {
                            
                            ForEach(nearbyStores) { store in
                            
                                WeeklyAdCard(
                                    storeName: store.storeName,
                                    imageName: store.logoName,
                                    weeklyAdURL: store.weeklyAdURL,
                                    distanceText: distanceText(for: store)
                                )
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Matjakt")
            
            .refreshable {
                await refreshStores()
            }
            
            .onAppear {
                Task {
                    await refreshStores()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

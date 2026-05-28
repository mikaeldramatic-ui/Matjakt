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
                            
                            WeeklyAdCard(
                                storeName: "Willys Alingsås",
                                imageName: "cart.fill" ,
                                weeklyAdURL: "https://www.willys.se/erbjudanden/butik"
                            )
                            
                            WeeklyAdCard(
                                storeName: "ICA Maxi Alingsås",
                                imageName: "basket.fill",
                                weeklyAdURL: "https://www.ica.se/erbjudanden/maxi-ica-stormarknad-alingsas-1003647/"
                            )
                            
                            WeeklyAdCard(
                                storeName: "Coop Alingsås",
                                imageName: "bag.fill",
                                weeklyAdURL: "https://www.coop.se/butiker-erbjudanden/coop/coop-alingsas/"
                            )
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

//
//  WeeklyAdCard.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-14.
//

import SwiftUI

struct WeeklyAdCard: View {
    
    let storeName: String
    let imageName: String
    let weeklyAdURL: String
    let distanceText: String
    
    @State private var showSafari = false
    
    var body: some View {
        
        VStack (spacing: 12) {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 140 ,maxHeight: 60)
                .padding(.top)
            
            Text(storeName)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Label(distanceText, systemImage: "location.fill")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Button("Öppna veckoblad") {
                showSafari = true
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: 230)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
        .sheet(isPresented: $showSafari) {
            
            if let url = URL(string: weeklyAdURL) {
                
                SafariView(url: url)
            }
        }
    }
}

#Preview {
    WeeklyAdCard(
        storeName: "Willys",
        imageName: "cart.fill",
        weeklyAdURL: "https://www.willys.se/erbjudanden/butik",
        distanceText: "350 m bort"
    )
}

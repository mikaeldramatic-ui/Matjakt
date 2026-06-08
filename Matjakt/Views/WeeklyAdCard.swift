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
        
        VStack (spacing: AppSpacing.medium) {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: AppSizes.logoWidth ,maxHeight: AppSizes.logoHeight)
                .padding(.top)
            
            Text(storeName)
                .font(AppFonts.heading)
                .multilineTextAlignment(.center)
            
            Label(distanceText, systemImage: "location.fill")
                .font(AppFonts.caption)
                .foregroundStyle(.secondary)
            
            Button("Öppna veckoblad") {
                showSafari = true
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: AppSizes.cardWidth)
        .background(.thinMaterial)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppCornerRadius.card
            )
        )
        
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

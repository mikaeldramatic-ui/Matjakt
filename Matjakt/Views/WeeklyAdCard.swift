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
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 12) {
            
            Image(systemName: imageName)
                .font(.system(size: 40))
                .frame(maxWidth: .infinity)
                .padding(.top)
            
            Text(storeName)
                .font(.headline)
                .padding(.horizontal)
            
            Button("Öppna veckoblad") {
                
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: 220)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WeeklyAdCard(
        storeName: "Willys",
        imageName: "cart.fill"
    )
}

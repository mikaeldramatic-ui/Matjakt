//
//  HomeView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-14.
//

import SwiftUI

struct HomeView: View {
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
                                imageName: "cart.fill"
                            )
                            
                            WeeklyAdCard(
                                storeName: "ICA MAxi Alingsås",
                                imageName: "basket.fill"
                            )
                            
                            WeeklyAdCard(
                                storeName: "Coop Alingsås",
                                imageName: "bag.fill"
                            )
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Matjakt")
        }
    }
}

#Preview {
    HomeView()
}

//
//  AboutView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-06-08.
//

import SwiftUI

struct AboutView : View {
    
    var body: some View {
        
        List {
            
            Section("App") {
                
                HStack {
                    
                    Text("Version")
                    
                    Spacer()
                    
                    Text("1.0")
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Utvecklare") {
                
                Text("Mikael Engvall")
            }
            
            Section ("Om Matjakt") {
                
                Text("""
                    Matjakt hjälper dig att jämföra priser,
                    hitta erbjudanden och planera dina inköp
                    """
                )
            }
        }
        .navigationTitle("Om Matjakt")
    }
}

#Preview {
    AboutView()
}

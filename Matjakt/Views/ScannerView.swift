//
//  ScannerView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-13.
//

import SwiftUI

struct ScannerView: View {
    
    @State private var scannedCode = "Ingen kod ännu"
    @State private var selectedProduct: Product?
    
    @StateObject var productViewModel = ProductViewModel()
    
    var body: some View {
        
        VStack{
            
            BarcodeScannerView(scannedCode: $scannedCode)
                .frame(height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            Text(scannedCode)
                .font(.headline)
                .padding()
        }
        .navigationTitle("Scanner")
        .onChange(of: scannedCode) { _, newCode in
            
            if let product = productViewModel.findProduct(by: newCode) {
                selectedProduct = product
            }
        }
        .sheet(item: $selectedProduct) {product in
            
            NavigationStack {
                ProductDetailView(product: product)
                
            }
        }
    }
}

#Preview {
    ScannerView()
}

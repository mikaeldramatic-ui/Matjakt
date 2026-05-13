//
//  BarcodeScannerView.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-13.
//

import SwiftUI
import AVFoundation

struct BarcodeScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        
        let controller = ScannerViewController()
        controller.delegate = context.coordinator
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ScannerViewControllerDelegate {
        
        let parent: BarcodeScannerView
        
        init(parent: BarcodeScannerView) {
            self.parent = parent
        }
        
        func didFindCode(_ code: String) {
            parent.scannedCode = code
        }
    }
}

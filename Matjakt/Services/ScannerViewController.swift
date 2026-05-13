//
//  ScannerViewController.swift
//  Matjakt
//
//  Created by Mikael Engvall on 2026-05-13.
//
import UIKit
import AVFoundation

protocol ScannerViewControllerDelegate: AnyObject {
    func didFindCode(_ code: String)
}

class ScannerViewController: UIViewController {
    
    weak var delegate: ScannerViewControllerDelegate?
    
    private let captureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        setupCamera()
    }
    
    private func setupCamera() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            let availableTypes = metadataOutput.availableMetadataObjectTypes

            print("AVAILABLE TYPES:", availableTypes)

            metadataOutput.metadataObjectTypes = availableTypes
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        
        guard let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let code = object.stringValue else {
            return
        }
        print("SCANNED:", code)
        
        delegate?.didFindCode(code)
    }
}

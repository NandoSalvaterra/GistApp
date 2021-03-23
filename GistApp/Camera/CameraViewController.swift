//
//  CameraViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet private weak var cameraView: UIView!

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    // MARK: - Private API

    private func setupView() {
        cameraView.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        do { videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch { showErrorView() ; return }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else { showErrorView() ; return }

        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else { showErrorView() ; return }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        cameraView.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }

    private func showErrorView() {
        let errorViewController = UIAlertController(title: "Leitor de QRCode não suportado", message: "Seu dispositivo não suporta o leitor de QRCode. Por favor use um dispositivo com câmera.", preferredStyle: .alert)
        errorViewController.addAction(UIAlertAction(title: "OK", style: .default))
        present(errorViewController, animated: true)
        captureSession = nil
    }

    func found(code: String) {
        print(code)
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension CameraViewController: AVCaptureMetadataOutputObjectsDelegate {

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        dismiss(animated: true)
    }
}

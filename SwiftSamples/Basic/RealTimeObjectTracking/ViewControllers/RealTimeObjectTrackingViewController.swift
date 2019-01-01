//
//  RealTimeObjectTrackingViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/01.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class RealTimeObjectTrackingViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startCapture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // カメラキャプチャの開始
    private func startCapture() {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        // 入力の指定
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        guard captureSession.canAddInput(input) else { return }
        captureSession.addInput(input)
        
        // 出力の指定
        let output: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
        guard captureSession.canAddOutput(output) else { return }
        captureSession.addOutput(output)
        
        // プレビューの指定
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
        
        // キャプチャ開始
        captureSession.startRunning()
    }
}

extension RealTimeObjectTrackingViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // CMSampleBufferをCVPixelBufferに変換
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // CoreMLのモデルクラスの初期化
        if #available(iOS 11.0, *) {
            guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
            // 画像認識リクエストを作成（引数はモデルとハンドラ）
            let request = VNCoreMLRequest(model: model) {
                [weak self] (request: VNRequest, error: Error?) in
                guard let results = request.results as? [VNClassificationObservation] else { return }
                
                // 判別結果とその確信度を上位3件まで表示
                // identifierは類義語がカンマ区切りで複数書かれていることがあるので、最初の単語のみ取得する
                let displayText = results.prefix(4).compactMap { "\(Int($0.confidence * 100))% \($0.identifier.components(separatedBy: ", ")[0])" }.joined(separator: "\n")
                
                DispatchQueue.main.async {
                    self?.textView.text = displayText
                }
            }
            // CVPixelBufferに対し、画像認識リクエストを実行
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        } else {
            // Fallback on earlier versions
        }
    }
}

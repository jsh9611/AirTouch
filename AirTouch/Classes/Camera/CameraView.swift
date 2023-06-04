//
//  CameraView.swift
//  AirTouch
//
//  Created by SeongHoon Jang on 2023/06/01.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let cvc = CameraViewController()
        cvc.pointsProcessorHandler = pointsProcessorHandler
        return cvc
    }
    
    func updateUIViewController(
        _ uiViewController: CameraViewController,
        context: Context
    ) {
    }
}

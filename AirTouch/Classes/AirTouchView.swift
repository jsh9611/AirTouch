//
//  AirTouchView.swift
//  AirTouchView
//
//  Created by SeongHoon Jang on 2023/06/01.
//

import SwiftUI

public struct AirTouchView<Content: View>: View {
    @ObservedObject var airTouchController: AirTouchController
    
    let content: () -> Content
    
    public init(airTouchController: AirTouchController, content: @escaping () -> Content) {
        self.airTouchController = airTouchController
        self.content = content
    }

    public var body: some View {
        ZStack {
            CameraView {
              airTouchController.changeHandGestureStatus($0)
            }
            content()
        }
        .overlay(
            OverlayPoint(with: airTouchController.overlayPoints)
                .foregroundColor(airTouchController.pointColor)
        )
    }
}

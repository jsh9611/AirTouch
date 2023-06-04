//
//  ViewController.swift
//  AirTouch
//
//  Created by jsh9611 on 06/01/2023.
//  Copyright (c) 2023 jsh9611. All rights reserved.
//

//import UIKit
//import AirTouch
//import SwiftUI

import SwiftUI
import AirTouch

struct ExampleView: View {
    @StateObject var airTouchController = AirTouchController()
    
    var body: some View {
        AirTouchView {
            Text("Example View")
                .onReceive(airTouchController.$pointStatus) { _ in
                    if airTouchController.selectPosition([4,7]) {
                      print("back")
                    }
                    if airTouchController.selectPosition([6,9]) {
                      print("front")
                    }
                }
        }
        .overlay(
            OverlayPoint(with: airTouchController.overlayPoints)
                .foregroundColor(airTouchController.pointColor)
        )
    }
}

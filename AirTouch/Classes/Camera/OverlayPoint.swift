//
//  OverlayPoint.swift
//  AirTouch
//
//  Created by SeongHoon Jang on 2023/06/01.
//

import SwiftUI

public struct OverlayPoint: Shape {
    let points: [CGPoint]
    private let pointsPath = UIBezierPath()
    
    public init(with points: [CGPoint]) {
        self.points = points
    }
    
    public func path(in rect: CGRect) -> Path {
        for point in points {
            pointsPath.move(to: point)
            pointsPath.addArc(withCenter: point, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        }
        
        return Path(pointsPath.cgPath)
    }
}

import Combine
import Foundation
import SwiftUI

public final class AirTouchController: ObservableObject {
    @Published public var overlayPoints: [CGPoint] = []
    @Published public var pointStatus: Status = .unknown
    @Published private var triggeredPoint = CGPoint(x: 0, y: 0)

    public enum Status: Equatable {
        case pinched
        case apart
        case unknown
        case number(Int)
    }
    
    public var pointColor: Color {
        switch pointStatus {
        case .pinched:
            return .green
        case .apart, .unknown:
            return .red
        default:
            return .clear
        }
    }
    
    public func selectPosition(_ numbers: [Int]) -> Bool {
        return numbers.map { Status.number($0) }.contains(pointStatus)
    }
    
    private var lastObservationTimestamp = Date()
    
    private var pinchEvidenceCounter = 0
    private var apartEvidenceCounter = 0
    private let pinchMaxDistance: CGFloat
    private let evidenceCounterStateTrigger: Int
    
    public init(pinchMaxDistance: CGFloat = 40, evidenceCounterStateTrigger: Int = 3) {
        self.pinchMaxDistance = pinchMaxDistance
        self.evidenceCounterStateTrigger = evidenceCounterStateTrigger
    }
    
    internal func changeHandGestureStatus(_ points: [CGPoint]) {
        overlayPoints = points
        if points.count >= 2 {
            let thumbTip = points[0]
            let indexTip = points[1]
            let distance = hypot(indexTip.x - thumbTip.x, indexTip.y - thumbTip.y)
            if distance < pinchMaxDistance {
                // Keep accumulating evidence for pinch state.
                pinchEvidenceCounter += 1
                apartEvidenceCounter = 0
                // Set new state based on evidence amount.
                if pinchEvidenceCounter >= evidenceCounterStateTrigger {
                    pointStatus = .pinched
                }
                
            } else {
                // Keep accumulating evidence for apart state.
                apartEvidenceCounter += 1
                pinchEvidenceCounter = 0
                // Set new state based on evidence amount.
                if apartEvidenceCounter >= evidenceCounterStateTrigger {
                    if pointStatus == .pinched {
                        pointStatus = changePointTriggeredStatus(thumbTip)
                    } else {
                        pointStatus = .apart
                    }
                }
            }
            
        } else {
            if Date().timeIntervalSince(lastObservationTimestamp) > 2 {
                reset()
            }
        }
    }
    
    private func reset() {
        pointStatus = .unknown
        pinchEvidenceCounter = 0
        apartEvidenceCounter = 0
    }
    
    private func changePointStatus(points: [CGPoint]) {
        var x = CGFloat(0), y = CGFloat(0)
        for point in points {
            x += point.x
            y += point.y
        }
        
    }
    
    private func changePointTriggeredStatus(_ point: CGPoint) -> Status {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let width = window?.screen.bounds.width ?? 0
        let height = window?.screen.bounds.height ?? 0

        let command: Status
        
        if point.x < 0 || point.x > width || point.y < 0 || point.y > height {
            command = .number(0)
            
        } else {
            if point.y < height * 1 / 5 {

                if point.x < width * 1 / 3 {
                    command = .number(1)
                } else if point.x < width * 2 / 3 {
                    command = .number(2)
                } else {
                    command = .number(3)
                }

            } else if point.y < height * 2 / 5 {

                if point.x < width * 1 / 3 {
                    command = .number(4)
                } else if point.x < width * 2 / 3 {
                    command = .number(5)
                } else {
                    command = .number(6)
                }

            } else if point.y < height * 3 / 5 {

                if point.x < width * 1 / 3 {
                    command = .number(7)
                } else if point.x < width * 2 / 3 {
                    command = .number(8)
                } else {
                    command = .number(9)
                }

            } else if point.y < height * 4 / 5 {

                if point.x < width * 1 / 3 {
                    command = .number(10)
                } else if point.x < width * 2 / 3 {
                    command = .number(11)
                } else {
                    command = .number(12)
                }

            } else {

                if point.x < width * 1 / 3 {
                    command = .number(13)
                } else if point.x < width * 2 / 3 {
                    command = .number(14)
                } else {
                    command = .number(15)
                }

            }
        }
        
        return command
    }
}

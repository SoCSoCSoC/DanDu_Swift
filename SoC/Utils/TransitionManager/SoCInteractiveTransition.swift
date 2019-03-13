//
//  SoCInteractiveTransition.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SoCInteractiveTransition: UIPercentDrivenInteractiveTransition {
    enum SoCEdgePanGestureDirection {
        case SoCPanEdgeTop
        case SoCPanEdgeLeft
        case SoCPanEdgeBottom
        case SoCPanEdgeRight
    }
    
    var eventHandler : (()->(Void))?

    var isPanGestureInteration : Bool = true
    
    private var gestureView : UIView?
    private var panGesture : UIScreenEdgePanGestureRecognizer?
    
    func addEdgePageGesture(view : UIView, direction: SoCEdgePanGestureDirection) {
        let popRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePopRecognizer(recognizer:)))
        switch direction {
        case .SoCPanEdgeTop:
            popRecognizer.edges = UIRectEdge.top
        case .SoCPanEdgeLeft:
            popRecognizer.edges = UIRectEdge.left
        case .SoCPanEdgeBottom:
            popRecognizer.edges = UIRectEdge.bottom
        default:
            popRecognizer.edges = UIRectEdge.right
        }
        gestureView = view
        gestureView?.addGestureRecognizer(popRecognizer)
    }
    
    @objc func handlePopRecognizer(recognizer: UIPanGestureRecognizer) {
        var progress = abs(recognizer.translation(in: gestureView).x)
        progress = CGFloat(min(1.0, Double.maximum(0.0, Double(progress))))
        switch recognizer.state {
        case .began:
            isPanGestureInteration = true
            if (eventHandler != nil) {
                eventHandler?()
            }
        case .changed:
            update(progress)
        case .ended, .cancelled:
            if progress > 0.5 {
                finish()
            }else {
                cancel()
            }
            isPanGestureInteration = false
        default: break
            
        }
    }
    override init() {
        
    }
}

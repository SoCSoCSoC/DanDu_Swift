//
//  SoCCircleRectSpreadAnimation.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SoCCircleRectSpreadAnimation: SoCTransitionManager {
    
    private var _startView : UIView = {
        return UIView()
    }()
    
    private var _centerPoint : CGPoint = CGPoint(x: 0, y: 0)
    
    init(startPoint : CGPoint) {
        _centerPoint = startPoint
    }
    
    private func frameToCircle(centerPoint: CGPoint, size:CGSize) -> (CGRect) {
        let radius_x = fmax(centerPoint.x, size.width-centerPoint.x)
        let radius_y = fmax(centerPoint.y, size.height-centerPoint.y)
        let endRadius = 2 * sqrt(pow(radius_x, 2) + pow(radius_y, 2))
        return CGRect(origin: CGPoint.zero, size: CGSize(width: endRadius, height: endRadius))
    }
    
    override func setToAnimation(contextTransition: UIViewControllerContextTransitioning) {
        let toVC = contextTransition.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = contextTransition.containerView
        let center = toVC?.view.center
        let rect = frameToCircle(centerPoint: _centerPoint, size: toVC!.view.bounds.size)
        let backView = UIView(frame: rect)
        backView.backgroundColor = .yellow
        backView.center = _centerPoint
        backView.layer.cornerRadius = backView.frame.size.height/2.0
        backView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        containerView.addSubview(backView)
        
        _startView = backView
        
        toVC?.view.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        toVC?.view.alpha = 0
        toVC?.view.center = _centerPoint
        containerView.addSubview(toVC!.view!)
        
        UIView.animate(withDuration: duration, animations: {
            backView.transform = CGAffineTransform.identity
            toVC?.view.center = center!
            toVC?.view.transform = CGAffineTransform.identity
            toVC?.view.alpha = 1
        }) { (complete) in
            contextTransition.completeTransition(!contextTransition.transitionWasCancelled)
        }
    }
    
    override func setBackAnimation(contextTransition: UIViewControllerContextTransitioning) {
        let fromVC = contextTransition.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = contextTransition.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let containerView = contextTransition.containerView
        containerView.insertSubview(toVC!.view!, at: 0)
        
        UIView.animate(withDuration: duration, animations: {
            self._startView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            fromVC?.view.center = self._centerPoint
            fromVC?.view.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            fromVC?.view.alpha = 0
        }) { (finish) in
            contextTransition.completeTransition(!contextTransition.transitionWasCancelled)
            self._startView.removeFromSuperview()
        }
    }
}

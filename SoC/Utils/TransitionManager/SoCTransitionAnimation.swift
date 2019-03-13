//
//  SoCTransitionAnimation.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SoCTransitionAnimation: NSObject {
    var duration : TimeInterval = 0.5
    var animation : ((_ contextTransitioning : UIViewControllerContextTransitioning) -> (Void))?
    init(duration: TimeInterval) {
        self.duration = duration
    }
}


extension SoCTransitionAnimation : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if (nil != animation) {
            animation?(transitionContext)
        }
    }
    
    
}

//
//  SoCTransitionManager.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SoCTransitionManager: NSObject {
    
    var duration : TimeInterval = 0.5
    
    lazy var toTransitionAnimation : SoCTransitionAnimation = {
        let animation = SoCTransitionAnimation(duration: duration)
        animation.animation = {(_ contextTransitioning : UIViewControllerContextTransitioning) -> (Void) in
            self.setToAnimation(contextTransition: contextTransitioning)
        }
        return animation
    }()
    lazy var backTransitionAnimation : SoCTransitionAnimation = {
        let animation = SoCTransitionAnimation(duration: duration)
        animation.animation = {(_ contextTransitioning : UIViewControllerContextTransitioning) -> (Void) in
            self.setToAnimation(contextTransition: contextTransitioning)
        }
        return animation
    }()
    
    var toInteractiveTransition : SoCInteractiveTransition?
    func setToInteractiveTransition(interactiveTransition : SoCInteractiveTransition) {
        toInteractiveTransition = interactiveTransition
    }
    
    var backInteractiveTransition : SoCInteractiveTransition?
    func setBackInteractiveTransition(interactiveTransition : SoCInteractiveTransition) {
        backInteractiveTransition = interactiveTransition
    }
    var operation : UINavigationController.Operation?
    
    override init() {
        super.init()
    }
    
    
    
    public func setToAnimation(contextTransition : UIViewControllerContextTransitioning) {}
    public func setBackAnimation(contextTransition : UIViewControllerContextTransitioning) {}
}

extension SoCTransitionManager : UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    // UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return toTransitionAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return backTransitionAnimation
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return toInteractiveTransition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return backInteractiveTransition
    }
    
    // UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.operation = operation
        if operation == UINavigationController.Operation.push {
            return toTransitionAnimation
        }else if operation == UINavigationController.Operation.pop {
            return backTransitionAnimation
        }else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if operation == UINavigationController.Operation.push {
            return toInteractiveTransition
        }else {
            return backInteractiveTransition
        }
    }
    
    
}

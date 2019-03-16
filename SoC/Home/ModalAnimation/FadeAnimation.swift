//
//  FadeAnimation.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit


enum AnimationType {
    case present
    case dismiss
}

enum ModalViewControllerDirection {
    case left
    case right
}

class FadeAnimator: NSObject , UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var animationType: AnimationType?
    var fromVcDirection : ModalViewControllerDirection?
    
    
    // 指定转场动画持续的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let toView = toViewController?.view
        let fromView = fromViewController?.view
        
        let transitionTime = transitionDuration(using: transitionContext)
        let aDelay: TimeInterval = 0.2
        
        if animationType == .present {
            // first 放下面
            let snap = fromView?.snapshotView(afterScreenUpdates: true)
            transitionContext.containerView.addSubview(snap!)
            
            //Third放上面
            let snap2 = toView?.snapshotView(afterScreenUpdates: true)
            transitionContext.containerView.addSubview(snap2!)
            
            snap2?.transform = CGAffineTransform(translationX: fromVcDirection == .left ? -(UIScreen.main.bounds.size.width) :  (UIScreen.main.bounds.size.width), y: 0)
            
            UIView.animate(withDuration: transitionTime, delay: aDelay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                snap2?.transform = CGAffineTransform.identity
            }) { (finish) in
                // 删掉截图
                snap?.removeFromSuperview()
                snap2?.removeFromSuperview()
                
                // 添加视图
                transitionContext.containerView.addSubview(toView!)
                
                // 结束 Transition
                let aDidCom = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!aDidCom)
            }
        }
        else {
            // Third 放下面
            let snap = toView?.snapshotView(afterScreenUpdates: true)
            transitionContext.containerView.addSubview(snap!)
            
            // first 放上面
            let snap2 = fromView?.snapshotView(afterScreenUpdates: true)
            transitionContext.containerView.addSubview(snap2!)
            weak var weakSelf = self
            UIView.animate(withDuration: transitionTime, delay: aDelay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                snap2?.transform = CGAffineTransform(translationX: weakSelf?.fromVcDirection == .left ? -(UIScreen.main.bounds.size.width) :  (UIScreen.main.bounds.size.width), y: 0);
            }) { (finish) in
                // 删掉截图
                snap?.removeFromSuperview()
                snap2?.removeFromSuperview()
                
                //添加视图
                transitionContext.containerView.addSubview(fromView!)
                
                //结束Transition
                let aDidCom = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!aDidCom)
            }
        }
    }
}

extension FadeAnimator : UIViewControllerTransitioningDelegate {
    // 提供弹出时的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationType = .present
        return self
    }
    
    // 提供消失时的动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationType = .dismiss
        return self
    }
}

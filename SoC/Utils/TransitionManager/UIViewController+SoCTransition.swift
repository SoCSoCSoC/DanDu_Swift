//
//  File.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

var kToAnimationKey = "kToAnimationKey"


extension UIViewController {
//    func soc_Push(viewController : UIViewController, animation : SoCTransitionAnimation) {
//        if (nil == viewController || nil == animation) {return}
//        if (navigationController != nil) {
//
//        }
//
//    }
    var toInteractiveTransition: SoCInteractiveTransition {
        set {
            objc_setAssociatedObject(self, &kToAnimationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        get {
            return objc_getAssociatedObject(self, &kToAnimationKey) as! SoCInteractiveTransition
        }
    }
    
    
    func soc_present(viewController : UIViewController, animation : SoCTransitionManager) {
//        if viewController == nil {
//            return
//        }
//        if animation == nil {
//            return
//        }
        viewController.transitioningDelegate = animation
//        let toInteractiveTransition = objc_getAssociatedObject(self, &kToAnimationKey) as? SoCInteractiveTransition
        animation.setToInteractiveTransition(interactiveTransition: SoCInteractiveTransition())
//        objc_setAssociatedObject(viewController, &kToAnimationKey, animation, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        present(viewController, animated: true, completion: nil)
        
    }
  
}

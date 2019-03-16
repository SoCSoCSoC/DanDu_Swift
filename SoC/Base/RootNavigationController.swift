//
//  RootNavigationController.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationSettingUtils.setNavBarTransparent()
    }
}

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return viewControllers.last
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return viewControllers.last
    }
}

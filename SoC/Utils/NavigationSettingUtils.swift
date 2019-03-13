//
//  NavigationSettingUtils.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class NavigationSettingUtils: NSObject {
    // 设置 navbar 透明显示
    class func setNavBarTransparent() {
        let navBar = UINavigationBar.appearance();
        navBar.isTranslucent = true;
        navBar.setBackgroundImage(UIImage(), for: .default);
        navBar.shadowImage = UIImage()
    }
    

}

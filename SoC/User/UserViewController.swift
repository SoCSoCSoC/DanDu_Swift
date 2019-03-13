//
//  UserViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    lazy var topView : UserTopView = {
        let top = UserTopView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44))
        return top
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.alpha = 0.9
        view.addSubview(topView)
        topView.delegate = self
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    /// 状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// 状态栏是否隐藏
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    /// 状态栏的隐藏与显示动画样式
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

}

extension UserViewController : UserTopViewDelegate {
    func closeBtnClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func settingBtnClicked() {
        
    }
}

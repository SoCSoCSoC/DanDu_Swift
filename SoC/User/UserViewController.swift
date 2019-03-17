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
    
    lazy var logoView : UserLogoView = {
        let logo = UserLogoView(frame: CGRect(x: kScreenWidth/2-45, y: kStatusHeight+44+40, width: 90, height: 130))
        return logo
    }()
    
    lazy var copyrightView : UserCopyrightView = {
        let copyright = UserCopyrightView(frame: CGRect(x: 0, y: kScreenHeight-80, width: kScreenWidth, height: 50))
        return copyright
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.9)
        view.addSubview(topView)
        view.addSubview(logoView)
        view.addSubview(copyrightView)
        topView.delegate = self
        addMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topView.tansScale(big: true)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    let array : [String] = ["消     息", "收     藏", "离     线", "笔     记"]
    func addMenu() {
        for i in 0 ..< array.count {
            let btn = UIButton(type: UIButton.ButtonType.custom)
            btn.frame = CGRect(x: 0, y: CGFloat((kStatusHeight+44+130+40+30)+CGFloat(i*60)), width: kScreenWidth, height: 60)
            btn.tag = 181515+i
            btn.setTitleColor(.white, for: UIControl.State.normal)
            btn.setTitle(array[i], for: UIControl.State.normal)
            btn.titleLabel?.font = UIFont(name: "PMingLiU", size: 35.0)
            btn.addTarget(self, action: #selector(menuClicked(sender:)), for: .touchUpInside)
            view.addSubview(btn)
        }
    }
    
    @objc func menuClicked(sender : UIButton) {
            switch sender.tag - 181515 {
        case 0:
            infoBtnClicked()
        case 1:
            collectBtnClicked()
        case 2:
            downloadBtnClicked()
        default:
            noteBtnClicked()
        }
    }
    
}

extension UserViewController {
    func infoBtnClicked() {
        navigationController?.pushViewController(InfoViewController(), animated: true)
    }
    func collectBtnClicked() {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
    func downloadBtnClicked() {
        navigationController?.pushViewController(DownloadViewController(), animated: true)
    }
    func noteBtnClicked() {
        navigationController?.pushViewController(NoteViewController(), animated: true)
    }
}

extension UserViewController {
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
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}

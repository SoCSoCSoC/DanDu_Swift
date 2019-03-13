//
//  MenuViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    lazy var topView : MenuTopView = {
        let top = MenuTopView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44))
        return top
    }()
    
    lazy var logoImgView : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "dandu_50x25_")
        logo.contentMode = .center
        return logo
    }()
    
    lazy var leftLine : UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var rightLine : UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var sloganLab : UILabel = {
        let slogan = UILabel()
        slogan.text = "We Read The World"
        slogan.textColor = .white
        slogan.textAlignment = .center
        slogan.font = UIFont(name: "PMingLiU", size: 12)
        return slogan
    }()
    
    lazy var copyrightView : MenuCopyrightView = {
       return MenuCopyrightView()
    }()
    
    let tagViews : NSMutableArray = NSMutableArray(capacity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.alpha = 0.9
        view.addSubview(topView)
        topView.delegate = self
        view.addSubview(logoImgView)
        view.addSubview(sloganLab)
        view.addSubview(leftLine)
        view.addSubview(rightLine)
        
        view.addSubview(copyrightView)
        addMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logoImgView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.left.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(40)
        }
        sloganLab.snp.makeConstraints { (make) in
            make.top.equalTo(logoImgView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(kScreenWidth/5*1.5)
            make.width.equalTo(kScreenWidth/5*2)
            make.height.equalTo(40)
        }
        rightLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(sloganLab)
            make.right.equalTo(view)
            make.width.equalTo(kScreenWidth/5*1.5)
            make.height.equalTo(0.5)
        }
        leftLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(sloganLab)
            make.left.equalTo(view)
            make.width.equalTo(kScreenWidth/5*1.5)
            make.height.equalTo(0.5)
        }
        
        copyrightView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.width.equalTo(view)
            make.top.equalTo(view.snp.bottom).offset(-60)
            make.height.equalTo(20)
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topView.tansScale(big: true)
        copyrightView.tansScale(big: true)
        for btn in tagViews {
            let i = tagViews.index(of: btn)
            let tmpBtn : UIButton = btn as! UIButton
            UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
                tmpBtn.transform = CGAffineTransform(translationX: CGFloat(80*i), y: 0.0)
            }) { (finished) in
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        topView.tansScale(big: false)
        copyrightView.tansScale(big: false)
//        for btn in tagViews {
//            let i = tagViews.index(of: btn)+1
//            let tmpBtn : UIButton = btn as! UIButton
//            UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
//                tmpBtn.transform = CGAffineTransform(translationX: CGFloat(-80*(self.tagViews.count-i)), y: 0.0)
//            }) { (finished) in
//            }
//        }
    }
    let array : [String] = ["首    页","声    音","文    字","影    像","谈    论","单向历"]
    func addMenu() {
        for i in 0 ..< 6 {
            let btn = UIButton(type: UIButton.ButtonType.custom)
            btn.frame = CGRect(x: CGFloat(i*(-80)), y: CGFloat((190.0)+CGFloat(i*60)), width: kScreenWidth, height: 60)
            btn.tag = 181515+i
            btn.setTitleColor(.white, for: UIControl.State.normal)
            btn.setTitle(array[i], for: UIControl.State.normal)
            btn.titleLabel?.font = UIFont(name: "PMingLiU", size: 30.0)
            tagViews.add(btn)
            view.addSubview(btn)
        }
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

extension MenuViewController : MenuTopViewDelegate {
    func closeBtnClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBtnClicked() {
        
    }
    
    
}

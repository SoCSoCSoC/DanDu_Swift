//
//  TopNavView.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TopNavView: UIView {
    
    var backAction : (()->Void)?
    
    lazy var backBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 10, y: kStatusHeight+4, width: 40, height: 40)
        btn.setImage(UIImage(named: "back_gray_12x21_"), for: .normal)
        return btn
    }()
    
    lazy var titleLab : UILabel = {
        let lab = UILabel(frame: CGRect(x: kScreenWidth/2-40, y: kStatusHeight+4, width: 80, height: 40))
        lab.font = UIFont(name: "PMingLiU", size: 19)
        lab.textColor = .white
        lab.textAlignment = .center
        return lab
    }()
    
    init(frame: CGRect, title: String, back: @escaping (()->Void)) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(backBtn)
        addSubview(titleLab)
        backBtn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        titleLab.text = title
        backAction = back
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backBtnClicked() {
        if let backEvent = backAction {
            backEvent()
        }
    }
    
}

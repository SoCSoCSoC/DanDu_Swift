//
//  UserTopView.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import SnapKit

protocol UserTopViewDelegate {
    func closeBtnClicked()
    func settingBtnClicked()
}

class UserTopView: UIView {
    
    var delegate : UserTopViewDelegate?
    
    lazy var closeBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "Esc_21x21_"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(close), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var settingBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "Settings_25x25_"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(search), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(closeBtn)
        addSubview(settingBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(10)
            make.height.equalTo(self)
            make.width.equalTo(40)
        }
        
        settingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(closeBtn)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(self)
            make.width.equalTo(40)
        }
    }
    
    @objc func close() {
        if delegate != nil {
            delegate?.closeBtnClicked()
        }
    }
    
    @objc func search() {
        if delegate != nil {
            delegate?.settingBtnClicked()
        }
    }
    
}

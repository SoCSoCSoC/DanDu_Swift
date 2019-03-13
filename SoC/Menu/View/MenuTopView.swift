//
//  MenuTopView.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import SnapKit

protocol MenuTopViewDelegate {
    func closeBtnClicked()
    func searchBtnClicked()
}

class MenuTopView: UIView {
    
    var delegate : MenuTopViewDelegate?
    
    lazy var closeBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "Esc_21x21_"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(close), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var searchBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "searchbtn_21x21_"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(search), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(closeBtn)
        addSubview(searchBtn)
        closeBtn.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        searchBtn.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
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
        
        searchBtn.snp.makeConstraints { (make) in
            make.top.equalTo(closeBtn)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(self)
            make.width.equalTo(40)
        }
    }
    
    func tansScale(big: Bool) {
        UIView.animate(withDuration: 0.5) {
            let scale : CGFloat = big ? 1.0 : 0.0
            self.closeBtn.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.searchBtn.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    @objc func close() {
        if delegate != nil {
            delegate?.closeBtnClicked()
        }
    }
    
    @objc func search() {
        if delegate != nil {
            delegate?.searchBtnClicked()
        }
    }
    
}

//
//  DetailTopInteractiveView.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import SnapKit


protocol DetailTopInterViewEventProtocol {
    func backEvent()
}

class DetailTopInteractiveView: UIImageView {
    var delegate : DetailTopInterViewEventProtocol?
    
    lazy var backBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "后退_12x21_"), for: UIControl.State.normal)
        btn.contentHorizontalAlignment = .center
        btn.addTarget(self, action: #selector(back(sender:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    lazy var collectBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "store_normal_28x26_"), for: UIControl.State.normal)
        btn.contentHorizontalAlignment = .right
        return btn
    }()
    lazy var commentBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "comment_normal_26x27_"), for: UIControl.State.normal)
        btn.contentHorizontalAlignment = .right
        return btn
    }()
    lazy var shareBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "share_normal_19x26_"), for: UIControl.State.normal)
        btn.contentHorizontalAlignment = .center
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        addSubview(backBtn)
        addSubview(shareBtn)
        addSubview(commentBtn)
        addSubview(collectBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(self)
        }
        
        shareBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.equalTo(backBtn)
            make.width.equalTo(40)
            make.height.equalTo(self)
        }
        
        commentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn)
            make.right.equalTo(shareBtn.snp.left).offset(-10)
            make.width.height.equalTo(shareBtn)
        }
        
        collectBtn.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn)
            make.right.equalTo(commentBtn.snp.left).offset(-10)
            make.width.height.equalTo(shareBtn)
        }
    }
    
    @objc func back(sender : UIButton) {
        if delegate != nil {
            delegate?.backEvent()
        }
    }
}

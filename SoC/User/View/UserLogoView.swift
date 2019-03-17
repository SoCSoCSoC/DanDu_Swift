//
//  UserLogoView.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class UserLogoView: UIView {
    
    let hearderImgView : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        imgView.image = UIImage(named: "未登录头像_90x90_")
        return imgView
    }()
    
    let nameLab : UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 110, width: 90, height: 20))
        lab.text = "SoC"
        lab.textColor = UIColor.darkGray
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.textAlignment = .center
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hearderImgView)
        addSubview(nameLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

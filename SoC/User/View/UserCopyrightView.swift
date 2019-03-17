//
//  UserCopyrightView.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class UserCopyrightView: UIView {

    let copyrightImgView : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: kScreenWidth/2-30, y: 0, width: 60, height: 23))
        imgView.image = UIImage(named: "logo_owspace_60x21_")
        return imgView
    }()
    
    let versionLab : UILabel = {
        let lab = UILabel(frame: .zero)
        lab.text = "written by SoC."
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.textColor = .white
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(copyrightImgView)
        versionLab.frame = CGRect(x: 0, y: frame.size.height-10, width: kScreenWidth, height: 10)
        addSubview(versionLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

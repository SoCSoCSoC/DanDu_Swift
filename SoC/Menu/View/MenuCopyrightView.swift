//
//  MenuCopyrightView.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class MenuCopyrightView: UIView {
    
    lazy var copyrightLab : UILabel = {
        let copyright = UILabel()
        copyright.text = "Powered by OWSPACE"
        copyright.textColor = .white
        copyright.textAlignment = .center
        copyright.font = UIFont.systemFont(ofSize: 9)
        copyright.alpha = 0.8
        return copyright
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(copyrightLab)
        copyrightLab.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        copyrightLab.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.width.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(self)
        }
    }
    
    func tansScale(big: Bool) {
        UIView.animate(withDuration: 0.5) {
            let scale : CGFloat = big ? 1.0 : 0.0
            self.copyrightLab.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}

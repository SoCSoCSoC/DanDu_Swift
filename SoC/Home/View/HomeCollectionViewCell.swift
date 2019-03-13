//
//  HomeCollectionViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var headerImageView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#ad8a54")
        return line
    }()
    
    lazy var tagLab : UILabel = {
        let lab = UILabel()
        lab.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#ad8a54")
        lab.textColor = .white
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 10)
        return lab
    }()
    
    lazy var cardTagView : UIImageView = {
        let imgView = UIImageView()
        imgView.addSubview(lineView)
        imgView.addSubview(tagLab)
        return imgView
    }()
    
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 2
        lab.font = UIFont(name: "PMingLiU", size: 30)
        return lab
    }()
    
    lazy var descLab : UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 4
        lab.font = UIFont(name: "PMingLiU", size: 15)
        return lab
    }()
    
    lazy var sepaimagView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#e0e0df")
        return imgView
    }()
    
    lazy var commentBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.titleLabel?.font = UIFont(name: "PMingLiU", size: 12)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btn.setImage(UIImage(named: "评论_12x11_"), for: UIControl.State.normal)
        btn.setTitle(" 2", for: UIControl.State.normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        return btn
    }()
    
    lazy var followBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.titleLabel?.font = UIFont(name: "PMingLiU", size: 12)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btn.setImage(UIImage(named: "喜欢_12x11_"), for: UIControl.State.normal)
        btn.setTitle(" 10", for: UIControl.State.normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        return btn
    }()
    
    lazy var readCountLab : UILabel = {
        let lab = UILabel()
        lab.textAlignment = .right
        lab.font = UIFont(name: "PMingLiU", size: 12)
        lab.text = "阅读数:3.4w"
        return lab
    }()
    
    lazy var interView : UIView = {
        let v = UIView()
        v.addSubview(commentBtn)
        v.addSubview(followBtn)
        v.addSubview(readCountLab)
        return v
    }()
    
    lazy var authorLab : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "PMingLiU", size: 20)
        lab.textAlignment = .center
        lab.text = "雷 布拉德伯里"
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(self.frame.size.width*54/75)
        }
        cardTagView.snp.makeConstraints { (make) in
            make.width.equalTo(headerImageView)
            make.top.equalTo(headerImageView.snp.bottom)
            make.height.equalTo(60)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.width.equalTo(cardTagView)
            make.height.equalTo(2)
        }
        tagLab.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.equalTo(self.frame.size.width/5*2)
            make.width.equalTo(self.frame.size.width/5)
            make.height.equalTo(20)
        }
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(cardTagView.snp.bottom)
            make.width.equalTo(cardTagView)
            make.height.equalTo(70)
        }
        descLab.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom)
            make.left.equalTo(40)
            make.right.equalTo(self).offset(-40)
            make.height.equalTo(130)
        }
        sepaimagView.snp.makeConstraints { (make) in
            make.top.equalTo(descLab.snp.bottom).offset(8.0)
            make.width.equalTo(self.frame.width/2)
            make.left.equalTo(self.frame.width/4)
            make.height.equalTo(0.5)
        }
        interView.snp.makeConstraints { (make) in
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(headerImageView.snp.width)
            make.height.equalTo(40)
        }
        commentBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(interView.snp.centerY)
            make.left.equalTo(interView.snp.left).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(interView)
        }
        followBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(interView.snp.centerY)
            make.left.equalTo(commentBtn.snp.left).offset(40)
            make.width.equalTo(60)
            make.height.equalTo(interView)
        }
        readCountLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(interView.snp.centerY)
            make.right.equalTo(interView).offset(-20)
            make.width.equalTo(80)
            make.height.equalTo(interView)
        }
        authorLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(interView.snp.top)
            make.top.equalTo(sepaimagView.snp.bottom).offset(8.0)
            make.width.equalTo(headerImageView)
        }
    }
    
    func setupUI() {
        addSubview(headerImageView)
        addSubview(cardTagView)
        addSubview(titleLab)
        addSubview(descLab)
        addSubview(sepaimagView)
        addSubview(interView)
        addSubview(authorLab)
    }
    
    func setData(data : HomeModel) {
        let headerImg : URL = URL(string: data.thumbnail as String)!
        headerImageView.af_setImage(withURL: headerImg)
        tagLab.text = data.category! as String
        titleLab.attributedText = TextUtils.setLineSpace(space: 10.0, title: data.title! as String)
        titleLab.textAlignment = .center
        var desc = ""
        if data.lead!.length > 0 {
            desc = data.lead! as String
        }else {
            desc = data.excerpt! as String
        }
        descLab.attributedText = TextUtils.setLineSpace(space: 8.0, title: desc)
        descLab.textAlignment = .center
        authorLab.text = data.author! as String
        readCountLab.text = "阅读数 \(data.view! as String)"
    }
    
}

//
//  WordHeaderView.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

protocol WordHeaderClickedEventDelegate {
    func clickedWordHeaderView()
}

class WordHeaderView: UICollectionReusableView {

    var delegate : WordHeaderClickedEventDelegate?
    
    lazy var imageView : UIImageView = {
        let imgView = UIImageView(frame: bounds)
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    
    lazy var textLab : UILabel = {
        let lab = UILabel(frame: bounds)
        lab.textAlignment = .center
        lab.numberOfLines = 2
        lab.textColor = .white
        lab.font = UIFont(name: kFont, size: 14)
        lab.isUserInteractionEnabled = true
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(textLab)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickedJump))
        textLab.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickedJump() {
        if delegate != nil {
            delegate?.clickedWordHeaderView()
        }
    }
    
    func setData(img: String, text: String) {
        let url = URL(string: img)
        if url != nil {
            imageView.af_setImage(withURL: url!)
        }
        textLab.text = text
    }
    
}

//
//  WordCollectionViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class WordCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentImgView: UIImageView!
    @IBOutlet weak var contentLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customUI()
    }
    
    func customUI() {
        contentLab.font = UIFont(name: kFont, size: 12)
    }
    
    func setData(img: String, text: String, subtitle: String) {
        let url = URL(string: img)
        if let tmpUrl = url {
            contentImgView.af_setImage(withURL: tmpUrl)
        }
        var str : String = text
        if text != subtitle {
            str = "\(text)\n\(subtitle)"
        }
        contentLab.text = str
    }
    

}

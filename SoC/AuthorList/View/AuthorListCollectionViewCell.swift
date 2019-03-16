//
//  AuthorListCollectionViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class AuthorListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customUI()
    }
    
    func customUI() {
        titleLab.font = UIFont(name: kFont, size: 14)
        imgView.layer.cornerRadius = 40
        imgView.layer.masksToBounds = true
    }
    
    func setData(img: String, text: String) -> Void {
        let url = URL(string: img)
        if url != nil {
            imgView.af_setImage(withURL: url!)
        }
        titleLab.text = text
    }
}

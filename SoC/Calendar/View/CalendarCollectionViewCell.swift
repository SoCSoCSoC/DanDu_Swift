//
//  CalendarCollectionViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class CalendarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLab: UILabel!
    @IBOutlet weak var contentImgView: UIImageView!
    @IBOutlet weak var copyrightLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLab.font = UIFont(name: kFont, size: 14)
    }
    
    func setData(date: String, img: String) {
        dateLab.text = date
        let url = URL(string: img)
        if url != nil {
            contentImgView.af_setImage(withURL: url!)
        }
    }

}

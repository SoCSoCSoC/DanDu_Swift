//
//  ListTableViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tilteLab: UILabel!
    @IBOutlet weak var authorLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(img: NSString, text: NSString, author: NSString) {
        let url = URL(string: img as String)
        if url != nil {
            imgView.af_setImage(withURL: url!)
        }
        tilteLab.text = text as String
        authorLab.text = author as String
    }
    
}

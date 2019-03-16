//
//  TalkQuestionTableViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class TalkQuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var contentImgView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLab.font = UIFont(name: kFont, size: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(img: String, text: String) {
        let url = URL(string: img)
        if url != nil {
            contentImgView.af_setImage(withURL: url!)
        }
        titleLab.text = text
    }
    
}

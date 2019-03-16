//
//  TalkReaderTableViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import AlamofireImage

class TalkReaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImgView: UIImageView!
    
    @IBOutlet weak var nicknameLab: UILabel!
    
    @IBOutlet weak var timeLab: UILabel!
    
    @IBOutlet weak var contentLab: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var articleLab: UILabel!
    
    @IBOutlet weak var goImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        articleLab.font = UIFont(name: kFont, size: 20)
        SeparatorStyle.none
    }
    
    
    func setData(model : TalkReaderModel) {
        let url = URL(string: model.avatar)
        if url != nil {
//            headerImgView.af_setImage(withURL: url!)
        }
        nicknameLab.text = model.nickname
        timeLab.text = model.update_time
        contentLab.text = model.content
        articleLab.text = model.title
    }
}

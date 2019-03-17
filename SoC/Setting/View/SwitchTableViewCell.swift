//
//  SwitchTableViewCell.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLab.textColor = UIColor.hexadecimalColor(hexadecimal: "#ad8a54")
        switchBtn.onTintColor = UIColor.hexadecimalColor(hexadecimal: "#ad8a54")
        switchBtn.frame = CGRect(x: kScreenWidth-50, y: 8, width: 40, height: 37)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

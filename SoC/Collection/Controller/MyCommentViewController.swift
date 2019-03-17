//
//  MyCommentViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class MyCommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lab = UILabel(frame: CGRect(x: 0, y: view.frame.size.height/2-40, width: kScreenWidth, height: 80))
        lab.textColor = .lightGray
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.numberOfLines = 0
        lab.text = "还没有评论\n快去发表评论吧"
        view.addSubview(lab)
    }
    
}

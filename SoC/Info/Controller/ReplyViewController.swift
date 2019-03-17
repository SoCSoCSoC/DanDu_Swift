//
//  ReplyViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let lab = UILabel(frame: CGRect(x: 0, y: view.frame.size.height/2-10, width: kScreenWidth, height: 20))
        lab.textColor = .lightGray
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.text = "没有回复您的消息"
        view.addSubview(lab)
    }

}

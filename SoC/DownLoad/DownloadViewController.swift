//
//  DownloadViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {
    var topNavView : TopNavView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "离  线", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        
        let lab = UILabel(frame: CGRect(x: 0, y: view.frame.size.height/2-40, width: kScreenWidth, height: 80))
        lab.textColor = .lightGray
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.numberOfLines = 0
        lab.text = "还没有离线音频\n快去下载吧"
        view.addSubview(lab)
    }


}

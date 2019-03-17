//
//  WordSizeViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class WordSizeViewController: UIViewController {
    
    var topNavView : TopNavView?
    let source : [String] = ["小", "中", "大", "特大"]
    
    lazy var tableView : UITableView = {
        let tabView = UITableView(frame: CGRect.zero, style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "WordSizeTableViewCell", bundle: nil), forCellReuseIdentifier: "wordsizecellid")
        tabView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#faf6f3")
        tabView.tableFooterView = UIView()
        tabView.isScrollEnabled = false
        return tabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "正文字号", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        view.addSubview(tableView) 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        let topNavHeight = topNavView?.frame.size.height
        tableView.frame = CGRect(x: 0, y: topNavHeight!+10, width: kScreenWidth, height: (kScreenHeight-topNavHeight!-10))
    }

}

extension WordSizeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordsizecellid", for: indexPath) as! WordSizeTableViewCell
        cell.titleLab.text = source[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

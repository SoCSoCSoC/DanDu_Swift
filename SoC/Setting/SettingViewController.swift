//
//  SettingViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    var topNavView : TopNavView?
    
    lazy var tableView : UITableView = {
        let tabView = UITableView(frame: CGRect.zero, style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#faf6f3")
        tabView.register(UINib.init(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "Switchcellid")
        tabView.register(UINib.init(nibName: "WordTableViewCell", bundle: nil), forCellReuseIdentifier: "Wordcellid")
        tabView.register(UINib.init(nibName: "ArrowTableViewCell", bundle: nil), forCellReuseIdentifier: "Arrowcellid")
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultcellid")
        tabView.tableFooterView = UIView()
        tabView.sectionHeaderHeight = 10
        return tabView
    }()
    
    let section1 : [String] = ["消息推送", "清除缓存"]
    let section2 : [String] = ["正文字号", "夜间模式", "3G/4G流量离线缓存"]
    let section3 : [String] = ["关于", "应用评分", "意见反馈", "分享单读App"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#faf6f3")
        
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "笔  记", back: {[weak self] in
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
        tableView.frame = CGRect(x: 0, y: topNavHeight!, width: kScreenWidth, height: (kScreenHeight-topNavHeight!))
    }
    
}


extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Switchcellid", for: indexPath) as! SwitchTableViewCell
                cell.titleLab.text = section1[indexPath.row]
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Wordcellid", for: indexPath) as! WordTableViewCell
                cell.titleLab.text = section1[indexPath.row]
                cell.contentLab.text = "\(CacheManager.getCacheSize()) M"
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Arrowcellid", for: indexPath) as! ArrowTableViewCell
                cell.titleLab.text = section2[indexPath.row]
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Switchcellid", for: indexPath) as! SwitchTableViewCell
                cell.titleLab.text = section2[indexPath.row]
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Switchcellid", for: indexPath) as! SwitchTableViewCell
                cell.titleLab.text = section2[indexPath.row]
                
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Arrowcellid", for: indexPath) as! ArrowTableViewCell
            cell.titleLab.text = section3[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultcellid", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.hexadecimalColor(hexadecimal: "#ad8a54")
            cell.textLabel?.text = "退出登录"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 4
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            CacheManager.clearCache()
            tableView.reloadData()
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            navigationController?.pushViewController(WordSizeViewController(), animated: true)
        }
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                navigationController?.pushViewController(AboutViewController(), animated: true)
            }else if indexPath.row == 2{
                navigationController?.pushViewController(FeedbackViewController(), animated: true)
            }else{}
        }
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 5))
        view.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#faf6f3")
        return view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

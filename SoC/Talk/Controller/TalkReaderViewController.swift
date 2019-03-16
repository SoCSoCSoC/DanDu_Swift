//
//  TalkReaderViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TalkReaderViewController: UIViewController {
    
    var dataSource : [TalkReaderModel]?
    
    lazy var tableView : UITableView = {
        let tabView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-30-kStatusHeight-44), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "TalkReaderTableViewCell", bundle: nil), forCellReuseIdentifier: "TalkReaderCellId")
        return tabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = TalkReaderDataManager().readerModels
        view.addSubview(tableView)
    }

}

extension TalkReaderViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TalkReaderCellId", for: indexPath) as! TalkReaderTableViewCell
        let listModel = (dataSource?[indexPath.row])!
        cell.setData(model: listModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
//        let model = (dataSource?[indexPath.row])!
        detailVc.contentUrl = "https://baidu.com"
        navigationController?.pushViewController(detailVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let model = dataSource?[indexPath.row]
//        return (model?.generateCellHeight() ?? 0) + 130
        return 250
    }
}

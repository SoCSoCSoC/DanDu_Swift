//
//  ListViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var topNavView : TopNavView?
    var dataSource : [HomeModel]?
    
    lazy var tableView : UITableView = {
        let tabView = UITableView(frame: CGRect.zero, style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listcellid")
        return tabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        dataSource = ListDataManager().listModels
        
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "文 字", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        view.addSubview(topNavView!)
        view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        let topNavHeight = topNavView?.frame.size.height
        tableView.frame = CGRect(x: 0, y: topNavHeight!, width: kScreenWidth, height: (kScreenHeight-topNavHeight!))
    }

}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcellid", for: indexPath) as! ListTableViewCell
        let listModel = (dataSource?[indexPath.row])!
        cell.setData(img: listModel.thumbnail, text: listModel.title, author: listModel.author)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
        let model = (dataSource?[indexPath.row])!
        detailVc.contentUrl = model.html5 as String
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

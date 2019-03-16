//
//  TalkQuestionViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TalkQuestionViewController: UIViewController {

    var dataSource : [HomeModel]?
    
    lazy var tableView : UITableView = {
        let tabView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-30-kStatusHeight-44), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "TalkQuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "talkQuestionCellid")
        return tabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = TalkQuestionDataManager().questionModels
        view.addSubview(tableView)
    }
    
}
extension TalkQuestionViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "talkQuestionCellid", for: indexPath) as! TalkQuestionTableViewCell
        let listModel = (dataSource?[indexPath.row])!
        cell.setData(img: listModel.thumbnail as String, text: listModel.title as String)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

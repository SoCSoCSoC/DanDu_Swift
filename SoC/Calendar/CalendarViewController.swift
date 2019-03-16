//
//  CalendarViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    var topNavView : TopNavView?
    
    var dataSource : [HomeModel]!
    
    lazy var caldenarCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height-kStatusHeight-44)
        let collection = UICollectionView.init(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.register(UINib.init(nibName: "CalendarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarendarCardid")
        if #available(iOS 11.0, *) {
            collection.contentInsetAdjustmentBehavior = .never
        }else {}
        collection.isPagingEnabled = true
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "单向历", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        dataSource = CalendarDataManager().calendarModels
        view.addSubview(caldenarCollection)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        let topNavViewHeight = kStatusHeight + 44
        caldenarCollection.frame = CGRect(x: 0, y: topNavViewHeight, width: kScreenWidth, height: kScreenHeight-topNavViewHeight)
    }
    
}

extension CalendarViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarendarCardid", for: indexPath) as! CalendarCollectionViewCell
        let model = dataSource[indexPath.row]
        cell.setData(date: TimeUtils.transTime(timeStemp: model.create_time), img: model.thumbnail! as String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
        let model = dataSource[indexPath.row]
        detailVc.contentUrl = model.html5 as String
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

//
//  AuthorListViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class AuthorListViewController: UIViewController {
    var topNavView : TopNavView?
    
    var dataSource : [AuthorModel]!
    
    lazy var contentCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (kScreenWidth-30)/3, height: (kScreenWidth-30)/3+20)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView.init(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#333333")
        collection.register(UINib.init(nibName: "AuthorListCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "authorListId")
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
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "单读作者", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        dataSource = AuthorDataManager().authorModels
        view.addSubview(contentCollection)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        let topNavViewHeight = kStatusHeight + 44
        contentCollection.frame = CGRect(x: 0, y: topNavViewHeight, width: kScreenWidth, height: kScreenHeight-topNavViewHeight)
    }
    
}

extension AuthorListViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(AuthorDetailViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "authorListId", for: indexPath) as! AuthorListCollectionViewCell
        let model = dataSource[indexPath.row]
        cell.setData(img: model.avatar, text: model.nickname)
        return cell
    }
    
}

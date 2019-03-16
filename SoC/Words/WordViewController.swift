//
//  WordViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    var topNavView : TopNavView?
    
    lazy var contentCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.headerReferenceSize = CGSize(width: kScreenWidth-20, height: (kScreenWidth-20)/2.2)
        layout.itemSize = CGSize(width: (kScreenWidth-30)/2, height: (kScreenWidth-30)/2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView.init(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#333333")
        collection.register(UINib.init(nibName: "WordCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "wordCellid")
        collection.register(WordHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "wordHeaderID")
        if #available(iOS 11.0, *) {
            collection.contentInsetAdjustmentBehavior = .never
        }else {}
        collection.isPagingEnabled = true
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    var dataSource : [WordModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "文 字", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        view.addSubview(contentCollection)
        
        dataSource = WordDataManager().wordViewModels
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        let topNavViewHeight = kStatusHeight + 44
        contentCollection.frame = CGRect(x: 0, y: topNavViewHeight, width: kScreenWidth, height: kScreenHeight-topNavViewHeight)
    }
    
}

extension WordViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wordCellid", for: indexPath) as! WordCollectionViewCell
        let wordModel = (dataSource?[indexPath.row])!
        cell.setData(img: wordModel.thumbnail, text: wordModel.title, subtitle: wordModel.sign)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view : WordHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "wordHeaderID", for: indexPath) as! WordHeaderView
        view.delegate = self
        view.setData(img: "https://img.owspace.com/Public/uploads/Picture/2018-12-04/5c0616cb1f317.jpg", text: "原创作者")
        return view
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ListViewController(), animated: true)
    }
}

extension WordViewController : WordHeaderClickedEventDelegate {
    func clickedWordHeaderView() {
        navigationController?.pushViewController(AuthorListViewController(), animated: true)
    }
}


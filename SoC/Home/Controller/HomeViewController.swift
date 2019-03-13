//
//  HomeViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
     let transition = FadeAnimator()
    
    lazy var homeCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        let collection = UICollectionView.init(frame: view.frame, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCardId")
        if #available(iOS 11.0, *) {
            collection.contentInsetAdjustmentBehavior = .never
        }else {}
        collection.isPagingEnabled = true
        let swipGesture = UISwipeGestureRecognizer(target: self, action: #selector(test(gesture:)))
        collection.addGestureRecognizer(swipGesture)
        return collection
    }()
    
    @objc func test(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            print("right")
        }else if gesture.direction == .left {
            print("left")
        }else{}
        
    }
    
    var dataSource : NSMutableArray = NSMutableArray(capacity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false;
        view.addSubview(homeCollection)
        testRequest()
        dataSource = HomeModel.init().generateModel(datas: HomeDataManager.init().getData() as! [NSDictionary])
    }
    
    func testRequest () {
        let params : Dictionary = ["pno":"1","ps":"20","dtype":"json","key":"b1cb35152fd88cbaedaee4e32bb3860b"]
        Alamofire.request("http://v.juhe.cn/weixin/query", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let lab = UILabel.init(frame: CGRect(x: 5, y: 5, width: 120, height: 30))
        lab.font = UIFont(name: "PMingLiU", size: 19)
        lab.textColor = .white
        lab.textAlignment = .center
        lab.text = "单 读"
        navigationItem.titleView = lab
        
        let leftBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftBtn.contentMode = .center
        leftBtn.tintColor = .white
        leftBtn.setImage(UIImage(named: "导航_22x12_"), for: UIControl.State.normal)
        leftBtn.addTarget(self, action: #selector(toMenuPage), for: UIControl.Event.touchUpInside)
        
        let rightBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightBtn.contentMode = .center
        rightBtn.tintColor = .white
        rightBtn.setImage(UIImage(named: "Profile_25x25_"), for: UIControl.State.normal)
        rightBtn.addTarget(self, action: #selector(toUserPage), for: UIControl.Event.touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
    }
    
    @objc func toMenuPage() {
        let menuVC = MenuViewController()
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true, completion: nil)
    }
    
    @objc func toUserPage() {
        let userVC = UserViewController()
        userVC.transitioningDelegate = self
        present(userVC, animated: true, completion: nil)
    }
    
    /// 状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// 状态栏是否隐藏
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    /// 状态栏的隐藏与显示动画样式
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    
}


extension HomeViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate , UIViewControllerTransitioningDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCardId", for: indexPath) as! HomeCollectionViewCell
        cell.setData(data: dataSource[indexPath.row] as! HomeModel)
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC : DetailViewController = DetailViewController()
        let model : HomeModel = dataSource[indexPath.row] as! HomeModel
        detailVC.contentUrl = model.html5! as String
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // 提供弹出时的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.animationType = AnimationType.present
        transition.direction = presented.isKind(of: MenuViewController.self) ? .left : .right
        return transition
    }
    
    // 提供消失时的动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.animationType = AnimationType.dismiss
        transition.direction = dismissed.isKind(of: MenuViewController.self) ? .left : .right
        return transition
    }
    
}

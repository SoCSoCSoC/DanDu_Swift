//
//  HomeViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    let transition = FadeAnimator()
    fileprivate lazy var bag : DisposeBag = DisposeBag()
    var dataSource : [HomeModel] = [HomeModel]()
    
    lazy var homeCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let collection = UICollectionView.init(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCardId")
        if #available(iOS 11.0, *) {
            collection.contentInsetAdjustmentBehavior = .never
        }else {}
        collection.isPagingEnabled = true
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false;
        let homeVM = HomeVeiwModel()
        homeVM.homeObserable.asObservable()
            .bind(to: homeCollection.rx.items(cellIdentifier: "HomeCardId", cellType: HomeCollectionViewCell.self)) { row, home, cell in
                cell.setData(data: home)
            }
            .disposed(by: bag)
        homeCollection.rx.modelSelected(HomeModel.self).subscribe(onNext: {[weak self] (homeModel : HomeModel) in
            let detailVC : DetailViewController = DetailViewController()
            detailVC.contentUrl = homeModel.html5 as String
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }).disposed(by: bag)
        view.addSubview(homeCollection)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNav()
    }
    
    @objc func toMenuPage() {
        let menuVC = MenuViewController()
        let nav = UINavigationController(rootViewController: menuVC)
        nav.modalPresentationStyle = .custom
        transition.fromVcDirection = .left
        nav.transitioningDelegate = transition
        present(nav, animated: true, completion: nil)
    }
    
    @objc func toUserPage() {
        let userVC = UserViewController()
        let nav = UINavigationController(rootViewController: userVC)
        nav.modalPresentationStyle = .custom
        transition.fromVcDirection = .right
        nav.transitioningDelegate = transition
        present(nav, animated: true, completion: nil)
    }
    
}
extension HomeViewController {
    func configNav() {
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
        leftBtn.rx.tap.subscribe(onNext: { [weak self](_) in
            self?.toMenuPage()
        }).disposed(by: bag)
        
        let rightBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightBtn.contentMode = .center
        rightBtn.tintColor = .white
        rightBtn.setImage(UIImage(named: "Profile_25x25_"), for: UIControl.State.normal)
        rightBtn.rx.tap.subscribe(onNext: {[weak self] (_) in
            self?.toUserPage()
        }).disposed(by:bag)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }
}

extension HomeViewController {
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

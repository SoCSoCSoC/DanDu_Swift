//
//  SearchViewController.swift
//  
//
//  Created by SoC on 2019/3/13.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: UIViewController {

    fileprivate lazy var bag : DisposeBag = DisposeBag()
    
    
    lazy var searchBar : UISearchBar = {
        let bar = UISearchBar(frame: CGRect(x: 0, y: kStatusHeight+44, width: kScreenWidth, height: 30))
        bar.backgroundColor = .black
        bar.placeholder = "搜索文章标题和作者"
        bar.tintColor = .lightGray
        return bar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNav()
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func endEdit() {
        searchBar.endEditing(true)
    }

}

extension SearchViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}

extension SearchViewController {
    func configNav() {
        
        let topBgView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44))
        topBgView.backgroundColor = .black
        
        let lab = UILabel.init(frame: CGRect(x: (kScreenWidth-120)/2, y: kStatusHeight+4, width: 120, height: 30))
        lab.font = UIFont(name: "PMingLiU", size: 19)
        lab.textColor = .white
        lab.textAlignment = .center
        lab.text = "搜 索"
        
        let leftBtn = UIButton.init(frame: CGRect(x: 0, y: kStatusHeight+4, width: 40, height: 30))
        leftBtn.contentMode = .center
        leftBtn.tintColor = .white
        leftBtn.setImage(UIImage(named: "back_gray_12x21_"), for: UIControl.State.normal)
        leftBtn.rx.tap.subscribe({ [weak self](_) in
            self?.navigationController?.popViewController(animated: true)
        }).disposed(by: bag)
        topBgView.addSubview(lab)
        topBgView.addSubview(leftBtn)
        view.addSubview(topBgView)
    }
}

extension SearchViewController {
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

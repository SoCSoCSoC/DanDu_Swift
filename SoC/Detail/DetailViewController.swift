//
//  DetailViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var contentUrl : String?
    
    lazy var mainWebView : WKWebView = {
        let webViwe = WKWebView(frame: view.bounds)
        if #available(iOS 11.0, *) {
            webViwe.scrollView.contentInsetAdjustmentBehavior = .never
        }else {}
        webViwe.uiDelegate = self
        webViwe.navigationDelegate = self
        webViwe.scrollView.delegate = self
        let url : URL = URL(string: "\(contentUrl! as String)?client=iOS")!
        let request : URLRequest = URLRequest(url: url)
        webViwe.load(request)
        return webViwe
    }()
    
    lazy var topInteractiveView : DetailTopInteractiveView = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let topInterView = DetailTopInteractiveView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: statusBarHeight+44))
        return topInterView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false;
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(mainWebView)
        view.addSubview(topInteractiveView)
        topInteractiveView.delegate = self
        test()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NavigationSettingUtils.setNavBarTransparent()
    }
    
    
    func test() {
        mainWebView.configuration.userContentController.add(self, name: "moreComments")
    }
    
    
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

extension DetailViewController : UIScrollViewDelegate, DetailTopInterViewEventProtocol, WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("...")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetToShow = 200.0
        let alpha = 1 - (Float(offsetToShow) - Float(scrollView.contentOffset.y)) / Float(offsetToShow)
        topInteractiveView.image = getImageWithColor(color: UIColor.black.withAlphaComponent(CGFloat(alpha)))
    }
    
    func getImageWithColor(color : UIColor) -> UIImage {
        let rect : CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }
    
    func backEvent() {
        navigationController?.popViewController(animated: true)
    }
}



//
//  TalkViewController.swift
//  SoC
//
//  Created by SoC on 2019/3/13.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TalkViewController: UIViewController {

    var topNavView : TopNavView?
    var segmentView : SegmentView?
    
    lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView(frame: CGRect(x: 0, y: (segmentView?.frame.origin.y ?? 0.0)+30, width: kScreenWidth, height: kScreenHeight-30-kStatusHeight-44))
        scrollView.contentSize = CGSize(width: kScreenWidth * 2, height: kScreenHeight-30-(topNavView?.frame.size.height ?? 0.0))
        scrollView.isScrollEnabled = false
        let qVc = TalkQuestionViewController()
        let rVc = TalkReaderViewController()
        addChild(qVc)
        addChild(rVc)
        qVc.view.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: scrollView.frame.size.height)
        rVc.view.frame = CGRect(x: kScreenWidth, y: 0, width: kScreenWidth, height: scrollView.frame.size.height)
        scrollView.addSubview(qVc.view)
        scrollView.addSubview(rVc.view)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topNavView = TopNavView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusHeight+44), title: "谈 论", back: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        if let topNav = topNavView {
            view.addSubview(topNav)
        }
        segmentView = SegmentView(frame: CGRect(x: 0, y: (topNavView?.frame.size.height) ?? 0.0, width: kScreenWidth, height: 30))
        segmentView?.delegate = self
        view.addSubview(segmentView!)
        view.addSubview(scrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}


extension TalkViewController : SegmentActionEventDelegate {
    func clickedQuestionTab() {
        UIView.animate(withDuration: 0.2) {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    func clickedReaderTab() {
        UIView.animate(withDuration: 0.2) {
            self.scrollView.contentOffset = CGPoint(x: kScreenWidth, y: 0)
        }
    }
}

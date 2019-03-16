//
//  SegmentView.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import SnapKit

protocol SegmentActionEventDelegate {
    func clickedQuestionTab()
    func clickedReaderTab()
}

class SegmentView: UIView {
    
    var delegate : SegmentActionEventDelegate?
    
    lazy var questionTabBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: kScreenWidth/2-40-80, y: 0, width: 80, height: frame.size.height)
        btn.setTitle("单读问", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(questionTagClicked), for: .touchUpInside)
        return btn
    }()
    
    lazy var readerTabBtn : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: kScreenWidth/2+40, y: 0, width: 80, height: frame.size.height)
        btn.setTitle("读者论", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(readerTagClicked), for: .touchUpInside)
        return btn
    }()
    
    lazy var lineView : UIView = {
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#b28655")
        lineView.frame = CGRect(x: questionTabBtn.frame.origin.x, y: frame.size.height-2, width: questionTabBtn.frame.size.width, height: 2)
        return lineView
    }()
    
    lazy var sepaView : UIView = {
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = UIColor.lightGray
        lineView.frame = CGRect(x: 0, y: frame.size.height-0.5, width: kScreenWidth, height: 0.5)
        return lineView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(questionTabBtn)
        addSubview(readerTabBtn)
        addSubview(lineView)
        addSubview(sepaView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SegmentView {
    @objc func questionTagClicked() {
        UIView.animate(withDuration: 0.2) {
            self.lineView.frame = CGRect(x: self.questionTabBtn.frame.origin.x, y: self.frame.size.height-2, width: self.questionTabBtn.frame.size.width, height: 2)
        }
        if delegate != nil {
            delegate?.clickedQuestionTab()
        }
    }
    
    @objc func readerTagClicked() {
        UIView.animate(withDuration: 0.2) {
            self.lineView.frame = CGRect(x: self.readerTabBtn.frame.origin.x, y: self.frame.size.height-2, width: self.readerTabBtn.frame.size.width, height: 2)
        }
        if delegate != nil {
            delegate?.clickedReaderTab()
        }
    }
}

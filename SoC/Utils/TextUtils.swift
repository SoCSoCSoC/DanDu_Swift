//
//  TextUtils.swift
//  SoC
//
//  Created by SoC on 2019/3/11.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TextUtils: NSObject {
    
    class func setLineSpace(space: CGFloat, title: String) ->  NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: title)
        let paragrapgStyle = NSMutableParagraphStyle()
        paragrapgStyle.lineSpacing = space
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragrapgStyle, range: NSRange(location: 0, length: title.count))
        return attributedString
    }
    
}

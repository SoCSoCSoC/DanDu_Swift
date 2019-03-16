//
//  TalkReaderModel.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

@objcMembers
class TalkReaderModel: NSObject {
    
    var id : String = ""
    var pid : String = ""
    var uid : String = ""
    var post_id : String = ""
    var content : String = ""
    var create_time : String = ""
    var update_time : String = ""
    var status : String = ""
    var ip : String = ""
    var good : String = ""
    var model : String = ""
    var to_author_name : String = ""
    var report : String = ""
    var ignore : String = ""
    var under_id : String = ""
    var card_id : String = ""
    var hot : String = ""
    var nickname : String = ""
    var avatar : String = ""
    var title : String = ""
    var height : CGFloat = 0.0
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
//        generateCellHeight()
    }
    
    func generateCellHeight() -> CGFloat {
        let rect : CGRect = content.boundingRect(with: CGSize(width: kScreenWidth-70, height: 2000), options: NSStringDrawingOptions.usesFontLeading, attributes:[NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)] , context: nil)
//        height = rect.size.height+120
        return rect.size.height
    }
    
    
}

//
//  HomeModel.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import HandyJSON

@objcMembers
class HomeModel: NSObject {
    var author : NSString = ""
    var avatar : NSString = ""
    var bookmark : Int = 0
    var category : NSString = ""
    var comment : Int = 0
    var create_time : Int = 0
    var discover : Int = 0
    var excerpt : NSString = ""
    var fm : NSString = ""
    var fm_play : NSString = ""
    var good : Int = 0
    var hot_comments : NSArray = []
    var html5 : NSString = ""
    var id : Int = 0
    var lead : NSString = ""
    var link_url : NSString = ""
    var lunar_type : NSString = ""
    var model : Int = 0
    var name : NSString = ""
    var parseXML : Int = 0
    var position : Int = 0
    var publish_time : NSString = ""
    var share : NSString = ""
    var show_uid : Int = 0
    var status : NSString = ""
    var tags : NSArray = []
    var thumbnail : NSString!
    var title : NSString = ""
    var tpl : Int = 0
    var uid : Int = 0
    var update_time : NSString = ""
    var video : NSString = ""
    var view : NSString = ""
    var share_lunar : String = ""
    var bookmark_lunar : String = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
}

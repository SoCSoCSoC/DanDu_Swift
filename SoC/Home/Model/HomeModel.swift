//
//  HomeModel.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import HandyJSON

class HomeModel: HandyJSON {
    var author : NSString?
    var avatar : NSString?
    var bookmakr : Int?
    var category : NSString?
    var comment : Int?
    var create_time : Int?
    var discover : Int?
    var excerpt : NSString?
    var fm : NSString?
    var fm_play : NSString?
    var good : Int?
    var hot_comments : NSArray?
    var html5 : NSString?
    var id : Int?
    var lead : NSString?
    var link_url : NSString?
    var lunar_type : NSString?
    var model : Int?
    var name : NSString?
    var parseXML : Int?
    var position : Int?
    var publish_time : NSString?
    var share : NSString?
    var show_uid : Int?
    var status : NSString?
    var tags : NSArray?
    var thumbnail : NSString!
    var title : NSString?
    var tpl : Int?
    var uid : Int?
    var update_time : NSString?
    var video : NSString?
    var view : NSString?
    
    let dataSource : NSMutableArray = NSMutableArray(capacity: 0)

    required init(){}
    
    func generateModel(datas : [NSDictionary]) -> NSMutableArray {
        for dict in datas {
            if let object : HomeModel = HomeModel.deserialize(from: dict) {
                dataSource.add(object)
            }
        }
        return dataSource
    }
    
}

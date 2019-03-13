//
//  HomeDataManager.swift
//  SoC
//
//  Created by SoC on 2019/3/12.
//  Copyright © 2019 SoC. All rights reserved.
//

import Foundation
import HandyJSON


class HomeDataManager: NSObject {
    
    override init() {
        super.init()
    }
    
    func getData() -> NSArray {
        let jsonPath = Bundle.main.path(forResource: "Home", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic : NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let array : NSArray = jsonDic.object(forKey: "datas") as! NSArray;
        return array
    }
    
}

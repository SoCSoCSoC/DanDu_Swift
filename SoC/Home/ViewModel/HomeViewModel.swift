//
//  Home.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit
import RxSwift

class HomeVeiwModel {
    var homeObserable : Variable<[HomeModel]> = {
        var dataSource : [HomeModel] = [HomeModel]()
        let jsonPath = Bundle.main.path(forResource: "Home", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic : NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let array : NSArray = jsonDic.object(forKey: "datas") as! [[NSString : Any]] as NSArray
        for dict in array {
            dataSource.append(HomeModel(dict: dict as! [String : Any]))
        }
        return Variable(dataSource)
    }()
}

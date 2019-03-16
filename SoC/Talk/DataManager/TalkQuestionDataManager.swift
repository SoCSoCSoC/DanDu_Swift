//
//  TalkQuestionDataManager.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TalkQuestionDataManager {
    var questionModels : [HomeModel] = {
        var dataSource : [HomeModel] = [HomeModel]()
        let jsonPath = Bundle.main.path(forResource: "question", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic : NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let array : [[String : Any]] = jsonDic.object(forKey: "datas") as! [[NSString : Any]] as [[String : Any]]
        for dict in array {
            dataSource.append(HomeModel(dict: dict))
        }
        return dataSource
    }()
}

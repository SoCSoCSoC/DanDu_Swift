//
//  WordViewModel.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class WordDataManager {
    
    var wordViewModels : [WordModel] = {
        var dataSource : [WordModel] = [WordModel]()
        let jsonPath = Bundle.main.path(forResource: "word", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic : NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let datas : [String : Any] = jsonDic.object(forKey: "datas") as! [String : Any]
        let list : [[String : Any]] = datas["list"] as! [[String : Any]]
        for dict in list {
            dataSource.append(WordModel(dict: dict))
        }
        return dataSource
    }()

}

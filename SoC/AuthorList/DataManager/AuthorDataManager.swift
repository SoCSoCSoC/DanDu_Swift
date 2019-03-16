//
//  AuthorViewModel.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class AuthorDataManager {
    var authorModels : [AuthorModel] = {
        var dataSource : [AuthorModel] = [AuthorModel]()
        let jsonPath = Bundle.main.path(forResource: "author_dandu", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic : NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let array : [[String : Any]] = jsonDic.object(forKey: "datas") as! [[String : Any]]
        for dict in array {
            dataSource.append(AuthorModel(dict: dict))
        }
        return dataSource
    }()
}

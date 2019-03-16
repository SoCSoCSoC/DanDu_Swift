//
//  AuthorModel.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

@objcMembers
class AuthorModel: NSObject {

    var uid : String = ""
    var nickname : String = ""
    var avatar : String = ""
    var excerpt : String = ""
    var discover : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
}

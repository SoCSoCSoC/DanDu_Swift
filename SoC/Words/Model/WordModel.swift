//
//  WordModel.swift
//  SoC
//
//  Created by SoC on 2019/3/16.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

@objcMembers
class WordModel: NSObject {
    var id : String = ""
    var thumbnail : String = ""
    var title : String = ""
    var sign : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
}

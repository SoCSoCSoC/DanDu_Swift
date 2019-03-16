//
//  TimeUtils.swift
//  SoC
//
//  Created by SoC on 2019/3/17.
//  Copyright © 2019 SoC. All rights reserved.
//

import UIKit

class TimeUtils: NSObject {
    
    class func transTime(timeStemp : Int) -> String {
        let confromTimesp : Date = Date.init(timeIntervalSince1970: TimeInterval(exactly: timeStemp) ?? 0.0)
        let formate = DateFormatter.init()
        formate.dateStyle = .medium
        formate.timeStyle = .short
        formate.date(from: "YYYY-MM-dd")
        return formate.string(from: confromTimesp)
    }
    
}

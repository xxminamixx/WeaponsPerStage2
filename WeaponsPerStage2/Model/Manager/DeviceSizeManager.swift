//
//  DeviceSizeManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/30.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class DeviceSizeManager: NSObject {
    
    static let sharedInstance = DeviceSizeManager()
    
    // TODO: イニシャライザで値をセットするようにしたい
    var naviBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    var winLoseViewHeight: CGFloat = 0
    let statusBarHeight = UIApplication.shared.statusBarFrame.height

}

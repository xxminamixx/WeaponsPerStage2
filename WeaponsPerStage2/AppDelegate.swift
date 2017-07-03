//
//  AppDelegate.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All 	rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 初期データ流し込み
        JsonManager.initUserData()
        
        // 武器マスタの初期化
        DataSource.masterWeaponList = JsonManager.weaponsList()
        
        return true
    }

}


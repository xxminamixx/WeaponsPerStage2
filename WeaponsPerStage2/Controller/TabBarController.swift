//
//  TabBarController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/21.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タブバーの色を設定
        tabBar.barTintColor = UIColor.white
        // 選択時の色を設定
        UITabBar.appearance().tintColor = ConstColor.iconPurple
        
        // 非選択時の色を設定
        // iOS10以上の設定
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
        
        // TabBarのアイコン設定
        tabBar.items?[0].image = UIImage(named: "Home.png")
        tabBar.items?[1].image = UIImage(named: "Config.png")
        
        // TabBarのタイトル設定
        tabBar.items?[0].title = "ホーム"
        tabBar.items?[1].title = "設定"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
} 

//
//  ContainViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/24.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainViewController: SlideMenuController {
    
    override func awakeFromNib() {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "WeaponsSelectionViewController") {
            self.mainViewController = controller
        }
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SortViewController") {
            self.rightViewController = controller
        }
        super.awakeFromNib()
    }

    override func viewDidLoad() {

        // NavigationBarにボタン追加
        self.addRightBarButtonWithImage(UIImage(named: "Sort.png")!)
        // ステータスバーを隠さない
        SlideMenuOptions.hideStatusBar = false
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

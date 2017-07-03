//
//  ConfigViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = ConstText.config
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func format(_ sender: Any) {
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: ConstText.allDeleteMessage, defaultAction: {_ in
            
            // 全データ削除
            WeaponsPerStageStoreManager.DeleteAll()
            // 初期データを流し込む
            JsonManager.initUserData()
            
            let alert = AlertControllerManager.noActionAlert(title: nil, message: "初期化に成功しました")
                self.present(alert, animated: true, completion: {
                // アラートを閉じる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    alert.dismiss(animated: true, completion: {
                        // タブ切り替え処理
                        self.tabBarController?.selectedIndex = 0
                    })
                })
            })
        }), animated: true, completion: nil)
    }
    
    /// 勝敗ボタンの色を初期化
    @IBAction func formatWinLose(_ sender: Any) {
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: "本当に勝敗を初期化しますか？", defaultAction: {_ in
            // 勝敗初期化
            WeaponsPerStageStoreManager.winloseInit()
            
            let alert = AlertControllerManager.noActionAlert(title: nil, message: "初期化に成功しました")
            self.present(alert, animated: true, completion: {
                // アラートを閉じる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    alert.dismiss(animated: true, completion: {
                        // タブ切り替え処理
                        self.tabBarController?.selectedIndex = 0
                    })
                })
            })
        }), animated: true, completion: nil)
    }
    
    /// 選択した武器を全て初期化
    @IBAction func formatSetWeapon(_ sender: Any) {
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: "本当に選択武器を初期化しますか？", defaultAction: {_ in
            // 選択武器初期化
            WeaponsPerStageStoreManager.selectWeaponInit()
            
            let alert = AlertControllerManager.noActionAlert(title: nil, message: "初期化に成功しました")
            self.present(alert, animated: true, completion: {
                // アラートを閉じる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    alert.dismiss(animated: true, completion: {
                        // タブ切り替え処理
                        self.tabBarController?.selectedIndex = 0
                    })
                })
            })
        }), animated: true, completion: nil)

    }
    
    /// お気に入りを初期化
    @IBAction func formatFavorite(_ sender: Any) {
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: "本当にお気に入りを初期化しますか？", defaultAction: {_ in
            
            // お気に入り初期化
            WeaponsPerStageStoreManager.favoriteDeleteAll()
            
            let alert = AlertControllerManager.noActionAlert(title: nil, message: "初期化に成功しました")
            self.present(alert, animated: true, completion: {
                // アラートを閉じる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    alert.dismiss(animated: true, completion: {
                        // タブ切り替え処理
                        self.tabBarController?.selectedIndex = 0
                    })
                })
            })
        }), animated: true, completion: nil)

    }
}

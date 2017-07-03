//
//  SortViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/21.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class SortViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        // TableViewの初期設定
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: SortTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SortTableViewCell.nibName)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - TableViewDataSource
extension SortViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.weaponType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  SortTableViewCell.nibName, for: indexPath) as! SortTableViewCell
        
        cell.weaponsType.text = (weapon: DataSource.weaponType[indexPath.row]) as? String
        
        // 全武器表示セルのみ色を変更
        if indexPath.row == 0 {
            cell.backgroundColor = ConstColor.gray_e8e8e8
        }
        
        return cell
    }
}


// MARK: - TableViewDelegate
extension SortViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        if DataSource.weaponType[indexPath.row] == "すべて" {
            // 武器名DataSourceのfilterを外し全武器格納
            DataSource.weaponNameList = JsonManager.weaponsName()
            WeaponsSelectHandlingManager.isShowFavorite = false
        } else if DataSource.weaponType[indexPath.row] == "お気に入り" {
            // お気に入り武器を表示
            if WeaponsPerStageStoreManager.isFavoriteWeapon() {
                // お気に入り武器が存在するとき
                // お気に入り表示を表示する
                
                // お気に入りボタンを押した時にマスタをお気に入りで更新する
                var master: [[String:String]] = [[:]]
                for favoriteEntity in WeaponsPerStageStoreManager.favoriteWeaponsList() {
                    let weapon = DataSource.masterWeaponList?.filter({$0["name"] == favoriteEntity.weapon})
                    master.append((weapon?[0])!)
                }
                // 初期化時の空データを削除
                master.removeFirst()
                DataSource.masterWeaponList = master
                WeaponsSelectHandlingManager.isShowFavorite = true
            } else {
                // お気に入り武器が存在しないとき
                // お気に入りを表示させない
                DataSource.masterWeaponList = Array<[String:String]>()
                DataSource.weaponNameList = JsonManager.weaponsName()
                WeaponsSelectHandlingManager.isShowFavorite = false
            }
        } else {
            // MARK: マスタを更新
            
            // 選択した武器種でfilter
            DataSource.masterWeaponList = DataSource.masterWeaponList?.filter({$0["type"] == DataSource.weaponType[indexPath.row] })
            DataSource.weaponNameList = JsonManager.weaponsName()
            WeaponsSelectHandlingManager.isShowFavorite = false
        }

        self.slideMenuController()?.closeRight()
    }
}

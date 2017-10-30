//
//  JsonManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class JsonManager {
    
    static func initUserData() {
        
        /* TODO:
            ステージ配列の長さとその他DataSourceの配列の長さが同じ前提で作っているが、
            配列の長さが異なる時クラッシュするため対応方法検討する必要あり
        */
        // 永続化しているものが既にあるとき初期データの流し込みはしない
        if WeaponsPerStageStoreManager.weaponsPerStageList().count == 0 {
            // ステージ配列の分だけ回し永続化する
            for (index, element) in DataSource.stageList.enumerated() {
                let entity = WeaponsPerStageEntity()
                entity.stage = element
                entity.weapon = DataSource.weaponsList[index]
                entity.weaponIcon = DataSource.weaponsIcon[index]
                entity.subWeapon = DataSource.subWeaponsList[index]
                entity.specialWeapon = DataSource.specialWeaponsList[index]
                entity.winlose = "both"
                WeaponsPerStageStoreManager.addWeaponsPerStage(object: entity)
            }

        }
    }
    
//    static func weaponsList() -> Array<Dictionary<String, String>>? {
//        let json = try! JSONSerialization.jsonObject(with: getResourceJson(name: ConstText.weapons)!,
//                                                     options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
//        
//        guard let weapons = json.value(forKey: ConstText.weapons) as! Array<Dictionary<String, String>>? else {
//            return nil
//        }
//        
//        // 武器配列を返す
//        return weapons
//    }
    
    static func weaponsList(data: Data) -> Array<Dictionary<String, String>>? {
        let json = try! JSONSerialization.jsonObject(with: data,
                                                     options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        
        guard let weapons = json.value(forKey: ConstText.weapons) as! Array<Dictionary<String, String>>? else {
            return nil
        }
        
        // 武器配列を返す
        return weapons
    }

    
    // 武器個数を返す、パースに失敗している場合は0を返す
    static func CountAllWeapons() -> Int {
        guard let weaponsList = DataSource.masterWeaponList else {
            return 0
        }
        return weaponsList.count
    }
    
    /// 武器マスタから武器名だけの配列を作成し返す
    ///
    /// - Returns: 武器名配列
    static func weaponsName() -> Array<String> {
        return weaponsElementList(key: ConstText.name)
    }
    
    /// 武器マスタからサブ名だけの配列を作成し返す
    ///
    /// - Returns: サブ名配列
    static func subWeaponsNameList() -> Array<String> {
        return weaponsElementList(key: ConstText.sub)
    }
    
    /// 武器マスタからスペシャル名だけの配列を作成し返す
    ///
    /// - Returns: スペシャル名配列
    static func specialWeaponsList() -> Array<String> {
        return weaponsElementList(key: ConstText.special)
    }
    
    /// 武器マスタからkeyに応じたkey配列を返す
    ///
    /// - Parameter key: 武器辞書から欲しいkey
    /// - Returns: key配列 ex: 引数nameとするとname配列を返す
    static func weaponsElementList(key: String) -> Array<String> {
        guard let weaponsList = DataSource.masterWeaponList else {
            return []
        }
        
        var keyNameList = [String]()
        for weapon in weaponsList {
            if let value = weapon[key] {
                keyNameList.append(value)
            }
        }
        return keyNameList
    }
    
    /// jsonデータをData型で返す
    ///
    /// - Parameter name: ファイル名
    /// - Returns: jsonをDataにしたもの
    static func getResourceJson(name:String) -> Data? {
        let bundlePath : String = Bundle.main.path(forResource: "Resources", ofType: "bundle")!
        let bundle = Bundle(path: bundlePath)!
        if let jsonPath : String = bundle.path(forResource: name, ofType: "json") {
            let fileHandle : FileHandle = FileHandle(forReadingAtPath: jsonPath)!
            let jsonData : Data = fileHandle.readDataToEndOfFile()
            return jsonData
        }
        return nil
    }
}

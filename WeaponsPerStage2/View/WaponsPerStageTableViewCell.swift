//
//  WaponsPerStageTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

protocol WaponsPerStageTableViewCellDelegate {
    func toWeaponSelect(indexPath: IndexPath)
}

class WaponsPerStageTableViewCell: UITableViewCell {

    /// セルID
    static let nibName = "WaponsPerStageTableViewCell"
    var winloseStatus = "both"
    var indexPath: IndexPath = [0, 0]
    var completion: () -> Void = {}
    var delegate : WaponsPerStageTableViewCellDelegate?
    
    /// ステージ名ラベル
    @IBOutlet weak var stage: UILabel!
    /// 武器名ラベル
    @IBOutlet weak var weapon: UILabel!
    /// サブ名ラベル
    @IBOutlet weak var subWeapon: UILabel!
    /// スペシャル名ラベル
    @IBOutlet weak var specialWeapon: UILabel!
    /// 武器画像
    @IBOutlet weak var weaponImage: UIImageView!
    /// winボタン
    @IBOutlet weak var winButton: UIButton!
    /// loseボタン
    @IBOutlet weak var loseButton: UIButton!
    
    override func awakeFromNib() {
        // 初期読み込み時は両方のボタンをグレーにする
        buttonColorSwitch()
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// 自身のプロパティに値をセットする
    ///
    /// - Parameters:
    ///   - entity: ステージと武器情報のエンティティ
    ///   - indexPath: 選択しているセルのindexPath
    ///   - completion: winloseボタンを押したときのクロージャ
    func setup(entity: WeaponsPerStageEntity, indexPath: IndexPath, completion: @escaping () -> Void) {
        self.stage.text = entity.stage
        self.weapon.text = entity.weapon
        self.subWeapon.text = entity.subWeapon
        self.specialWeapon.text = entity.specialWeapon
        self.winloseStatus = entity.winlose ?? "both"
        self.indexPath = indexPath
        self.completion = completion
        self.weaponImage.image = UIImage(named: entity.weaponIcon ?? "wakaba-shooter.png ")
        buttonColorSwitch()
    }
    
    @IBAction func winButton(_ sender: Any) {
        winloseStatusChange(pushButton: "win")
    }
    
    @IBAction func loseButton(_ sender: Any) {
        winloseStatusChange(pushButton: "lose")
    }
    
    func winloseStatusChange(pushButton: String) {
        if let winloseValue = WeaponsPerStageStoreManager.winloseValue(indexPath: indexPath) {
            // winloseプロパティがnilではない場合
            
            if winloseValue == pushButton {
                // 押したボタンが既に選択されていた場合
                
                WeaponsPerStageStoreManager.both(indexPath: indexPath)
                winloseStatus = "both"
            } else {
                // 押したボタンが選択されていなかった場合
                
                if pushButton == "win" {
                    // winボタンを押していた場合
                    WeaponsPerStageStoreManager.win(indexPath: indexPath)
                } else if pushButton == "lose" {
                    // loseボタンを押していた場合
                    WeaponsPerStageStoreManager.lose(indexPath: indexPath)
                } else {
                    WeaponsPerStageStoreManager.both(indexPath: indexPath)
                }
                // 押したボタンのステータスに変更
                winloseStatus = pushButton
            }
        }
        
        buttonColorSwitch()
        completion()
    }
    
    /// 勝敗ボタンの色を切り替える
    ///
    /// - Parameter win: winボタンを押した時true, loseボタンをおしたときfalse
    func buttonColorSwitch() {
        if winloseStatus == "win" {
            winButton.backgroundColor = ConstColor.purple
            loseButton.backgroundColor = UIColor.gray
        } else if winloseStatus == "lose" {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = ConstColor.skyBlue
        } else {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func toWeaponSelect(_ sender: Any) {
        delegate?.toWeaponSelect(indexPath: indexPath)
    }
    
    /// 勝敗ボタンの色を初期化する
    func grayBothButtonColor() {
        winButton.backgroundColor = UIColor.gray
        loseButton.backgroundColor = UIColor.gray
    }
    
}



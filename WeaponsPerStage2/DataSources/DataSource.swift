//
//  DataSource.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    /// ステージデータ
    static let stageList = ["バッテラストリート", "フジツボスポーツクラブ", "コンブトラック", "海女美術大学", "チョウザメ造船", "タチウオパーキング", "ホッケふ頭"]
    
    /// 武器初期データ
    static var weaponsList = ["わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター", "わかばシューター"]
    
    /// TableViewに表示する武器アイコンデータ
    static var weaponsIcon = ["wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png", "wakaba-shooter.png" ,"wakaba-shooter.png"]
    
    /// 武器名と武器アイコンの対応データ
    static let weaponsIconRelation = ["4kスコープ" : "liter-3k-scope.png", "3kスコープカスタム" : "3k-scope-custom.png", ".52ガロンデコ" : "52-gallon-deco.png", ".52ガロン" : "52-gallon.png", ".96ガロンデコ" : "96-gallon-deco.png", ".96ガロン" : "96-gallon.png", "14式竹筒銃・甲" : "bamboozler-14-mk-1.png", "14式竹筒銃・乙" : "bamboozler-14-mk-2.png", "14式竹筒銃・丙" : "bamboozler-14-mk-3.png", "デュアルスイーパーカスタム" : "dual-sweeper-custom.png", "デュアルスイーパー" : "dual-sweeper.png","ジェットスイーパー" : "jet-sweeper.png","ジェットスイーパーカスタム" : "jet-sweeper-custom.png", "ダイナモローラーバーンド" : "dynamo-roller-burned.png", "ダイナモローラーテスラ" : "dynamo-roller-tesla.png", "ダイナモローラー" : "dynamo-roller.png", "H3リールガンチェリー" : "h3-reelgun-cherry.png", "H3リールガンD" : "h3-reelgun-d.png", "H3リールガン" : "h3-reelgun.png", "L3リールガンD" : "l3-reelgun-d.png", "L3リールガン" : "l3-reelgun.png", "ヒーローチャージャー" : "hero-charger.png", "ヒーローローラー" : "hero-roller.png", "ヒーローシューター" : "hero-shooter.png", "ヒッセン・ヒュー" : "hissen-hue.png", "ヒッセン" : "hissen.png", "リッター3kカスタム" : "liter-3k-custom.png", "ロングブラスターネクロ" : "long-blaster-necro.png", "リッター4k" : "liter-3k.png", "ロングブラスターカスタム" : "long-blaster-custom.png", "ロングブラスター" : "long-blaster.png", "スプラスピナーコラボ" : "sprat-spinner-collab.png", "スプラスピナー" : "sprat-spinner.png", "スプラスピナーリペア" : "sprat-spinner-repair.png", "バレルスピナーデコ" : "barrel-spinner-deco.png", "バレルスピナーリミックス" : "barrel-spinner-remix.png", "バレルスピナー" : "barrel-spinner.png", "ボールドマーカー7" : "bold-marker-7.png", "ボールドマーカーネオ" : "bold-marker-neo.png", "ボールドマーカー" : "bold-marker.png", "バケットスロッシャーデコ" : "bucket-slosher-deco.png", "バケットスロッシャーソーダ" : "bucket-slosher-soda.png" , "バケットスロッシャー" : "bucket-slosher.png", "カーボンローラーデコ" : "carbon-roller-deco.png", "カーボンローラー" : "carbon-roller.png", "スクリュースロッシャーネオ" : "screw-slosher-neo.png", "スクリュースロッシャー" : "screw-slosher.png", "スプラシューターコラボ" : "splat-shooter-collab.png" , "オクタシューター" : "octa-shooter.png", "スプラシューター" : "splat-shooter.png", "スプラシューターワサビ" : "sprat-shooter-wasabi.png", "ホットブラスターカスタム" : "hot-blaster-custom.png", "ホットブラスター" : "hot-blaster.png", "プライムシューターベリー" : "prime-shooter-berry.png", "プライムシューターコラボ" : "prime-shooter-collab.png", "プライムシューター" : "prime-shooter.png", "ノヴァブラスターネオ" : "nova-blaster-neo.png", "ノヴァブラスター" : "nova-blaster.png", "Rブラスターエリートデコ" : "r-blaster-eliter-deco.png", "Rブラスターエリート" : "r-blaster-elite.png", "ラピッドブラスターデコ" : "rapid-blaster-deco.png", "ラピッドブラスター" : "rapid-blaster.png", "スプラスコープ" : "splat-charger-scope.png", "スプラチャージャー" : "splat-charger.png", "スプラスコープワカメ" : "splat-wakame-scope.png", "スプラチャージャーワカメ" : "splat-charger-wakame.png", "スプラスコープベントー" : "splat-scope-bento.png", "スプラチャージャーベントー" : "splat-charger-bento.png", "スクイックリンα" : "squicklin-alpha.png", "スクイックリンβ" : "squicklin-beta.png", "スクイックリンγ" : "squicklin-gamma.png", "スプラローラーコラボ" : "splat-roller-collab.png" , "スプラローラー" : "splat-roller.png", "スプラローラーコロコロ" : "splat-roller-corocoro.png", "パブロ" : "pablo.png", "パブロ・ヒュー" : "pablo-hue.png", "パーマネント・パブロ" : "permanent-pablo.png", "ホクサイ": "hokusai.png", "ホクサイ・ヒュー" : "hokusai-hue.png", "シャープマーカー" : "sharp-marker.png", "シャープマーカーネオ" : "sharp-marker-neo.png", "プロモデラーRG" : "pro-modeler-rg.png", "プロモデラーMG" : "pro-modeler-mg.png", "プロモデラーPG" : "pro-modeler-pg.png", "N-ZAP83" : "n-zap-83.png", "N-ZAP85" : "n-zap-85.png", "N-ZAP89" : "n-zap-89.png", "わかばシューター" : "wakaba-shooter.png"]
    
    /// サブ初期データ
    static var subWeaponsList = ["スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム", "スプラッシュボム"]
    
    /// スペシャル初期データ
    static var specialWeaponsList = ["インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー", "インクアーマー"]
    
    /// 武器種データ
    static let weaponType = ["すべて", "お気に入り", "シューター", "リールガン",  "ブラスター", "スロッシャー", "ローラー", "筆", "スピナー", "チャージャー"]
    
    /// filterした武器種データ格納配列
    static var weaponNameList: Array<String>? = []
    
    /// アプリ内で扱うjsonをパースした全武器辞書配列
    static var masterWeaponList: Array<[String:String]>? = []
}



//
//  HomeViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import Social
import Photos
import SlideMenuControllerSwift
import GoogleMobileAds

class HomeViewController: UIViewController {

    /// ステージと武器を表示するTableView
    @IBOutlet weak var weaponsPerStageTableView: UITableView!
    
    /// 勝敗数を表示するView
    @IBOutlet weak var winLoseView: UIView!
    /// 勝敗ViewとTableViewとの仕切りView
    @IBOutlet weak var separatorView: UIView!
    
    /// winラベル
    @IBOutlet weak var winLabel: UILabel!
    /// loseラベル
    @IBOutlet weak var loseLabel: UILabel!
    /// 勝利数をカウント
    @IBOutlet weak var winCount: UILabel!
    /// 敗北数をカウント
    @IBOutlet weak var loseCount: UILabel!
    /// バナー表示ビュー
    @IBOutlet weak var bannerView: UIView!
    
    override func viewDidLoad() {
        // NavigationBarのタイトル
        navigationItem.title = ConstText.home
        
        // NavigationBarの高さをセット
        if let height = navigationController?.navigationBar.frame.size.height {
            DeviceSizeManager.sharedInstance.naviBarHeight = height
        }
        
        // TabBarの高さをセット
        if let height = tabBarController?.tabBar.frame.size.height {
             DeviceSizeManager.sharedInstance.tabBarHeight = height
        }
        
        // 勝敗Viewの高さをセット
        DeviceSizeManager.sharedInstance.winLoseViewHeight = winLoseView.frame.size.height
        
        // ラベルの色設定
        winLabel.textColor = ConstColor.purple
        winCount.textColor = ConstColor.purple
        loseLabel.textColor = ConstColor.skyBlue
        loseCount.textColor = ConstColor.skyBlue
        
        // 仕切りViewの色設定
        separatorView.backgroundColor = ConstColor.iconPurple
        
        // 広告の設定
        let banner = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        // AdMobで発行された広告ユニットIDを設定
        banner.adUnitID = "ここに広告ID埋め込む"
        banner.delegate = self
        banner.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        
        // テスト用の広告を表示する時のみ使用（申請時に削除）
        gadRequest.testDevices = [kGADSimulatorID]
        
        banner.load(gadRequest)
        self.bannerView.addSubview(banner)

        // キャプチャボタンをNavigationBarの右に追加
        let rightCaptureButton = UIButton()
        rightCaptureButton.setImage(UIImage(named: "Capture.png"), for: .normal)
        rightCaptureButton.sizeToFit()
        rightCaptureButton.addTarget(self, action: #selector(capture), for: UIControlEvents.touchUpInside)
        
        let rightSpaceButton = UIButton()
        rightSpaceButton.contentRect(forBounds: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        let rightTweetButton = UIButton()
        rightTweetButton.setImage(UIImage(named: "TwitterIcon.png"), for: .normal)
        rightTweetButton.sizeToFit()
        rightTweetButton.addTarget(self, action: #selector(tweetImage), for: UIControlEvents.touchUpInside)
        
        let rightCaptureButtonItem = UIBarButtonItem(customView: rightCaptureButton)
        let rightSpaceButtonItem = UIBarButtonItem(customView: rightSpaceButton)
        let rightTweetButtonItem = UIBarButtonItem(customView: rightTweetButton)

        self.navigationItem.setRightBarButtonItems([rightCaptureButtonItem, rightSpaceButtonItem,rightTweetButtonItem], animated: true)
        
        // ステージと武器一覧のTableViewの初期設定
        weaponsPerStageTableView.dataSource = self
        weaponsPerStageTableView.delegate = self
        let nib = UINib(nibName: WaponsPerStageTableViewCell.nibName, bundle: nil)
        weaponsPerStageTableView.register(nib, forCellReuseIdentifier: WaponsPerStageTableViewCell.nibName)
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 武器選択画面から戻ってきたときにTableView更新
        weaponsPerStageTableView.reloadData()
        // 勝敗ラベルを更新
        winLoseCountLoad()
        // 武器マスタの初期化
        DataSource.masterWeaponList = JsonManager.weaponsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func winLoseCountLoad() {
        self.winCount.text = WeaponsPerStageStoreManager.winCount().description
        self.loseCount.text = WeaponsPerStageStoreManager.loseCount().description
    }
    
    
    /// テーブルビューをキャプチャする
    ///
    /// - Returns: キャプチャ画像を返す
    func captureTableView() -> UIImage? {
        // TableViewのスクロールを最上に戻す
        let currentOffset = weaponsPerStageTableView.contentOffset
        weaponsPerStageTableView.contentOffset = CGPoint(x: 0, y: -weaponsPerStageTableView.contentInset.top)
        let image = self.weaponsPerStageTableView.captureImage()
        weaponsPerStageTableView.contentOffset = currentOffset
        return image
    }
    
    /// キャプチャボタンを押したときに呼び出され、TableViewをキャプチャする
    func capture() {
        if let image = captureTableView() {
            
            let result = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary, options: nil)

            if let anAlbum = result.firstObject {
                PHPhotoLibrary.shared().performChanges({
                    let createAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                    let albumChangeRequest = PHAssetCollectionChangeRequest(for: anAlbum)
                    albumChangeRequest!.addAssets([createAssetRequest.placeholderForCreatedAsset!] as NSArray)
                }, completionHandler: { (success, error) in
                    if success {
                        // アラート表示
                        self.alertController(title: nil, message: "キャプチャに成功しました。", completion: {})
                    } else {
                        self.alertController(title: nil, message: "キャプチャに失敗しました。", completion: {})
                    }
                })
            } else {
                // TODO: ライブラリにオブジェクトがない場合失敗する模様
                alertController(title: nil, message: "キャプチャに失敗しました。", completion: {})
            }
        }
    }
    
    // AlertControllerラッピングメソッド
    func alertController(title: String?, message: String?, completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "とじる", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            // ボタン押下時の処理
            completion()
        })
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// ツイートボタンを押した時に呼び出され、キャプチャ画像のツイート画面が開く
    func tweetImage() {
        if let image = captureTableView() {
            // ツイッター投稿画面を表示
            let twitterPostView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            twitterPostView.add(image)
            twitterPostView.setInitialText(ConstText.twitterInitialText)
            self.present(twitterPostView, animated: true, completion: nil)
        }
    }
    
}

// MARK: WaponsPerStageTableViewCellDelegate
extension HomeViewController: WaponsPerStageTableViewCellDelegate {
    
    func toWeaponSelect(indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ContainViewController")
        IndexManager.indexPath = indexPath
        
        // お気に入りがあったら
        if WeaponsPerStageStoreManager.isFavoriteWeapon() {
            // 武器ソートフラグを降ろし、お気に入り一覧を表示させる
            var master: [[String:String]] = [[:]]
            for favoriteEntity in WeaponsPerStageStoreManager.favoriteWeaponsList() {
                let weapon = DataSource.masterWeaponList?.filter({$0["name"] == favoriteEntity.weapon})
                master.append((weapon?.first)!)
            }
            // 初期化時の空データを削除
            master.removeFirst()
            DataSource.masterWeaponList = master
            
            WeaponsSelectHandlingManager.isShowFavorite = true
        }
        
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
}

// MARK: - TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: ステージの個数と武器の個数が同じなので今はステージの個数を参照他にいい方法あればそちらに変更したい
        return DataSource.stageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaponsPerStageTableViewCell.nibName, for: indexPath) as! WaponsPerStageTableViewCell
        
        // セルのデリゲート設定
        cell.delegate = self
        
        // TODO: 強制アンラップしているが、nil判定が必要
        let weaponStage = WeaponsPerStageStoreManager.weaponsPerStageList()[indexPath.row]
        cell.setup(entity: weaponStage, indexPath: indexPath, completion: {
            self.winCount.text = WeaponsPerStageStoreManager.winCount().description
            self.loseCount.text = WeaponsPerStageStoreManager.loseCount().description
        })
        
        cell.buttonColorSwitch()
        return cell
    }
    
}

        
// MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: カスタムセルの高さを固定にしているため定数にしているが、変更に対応できるように変数にしたい
        return 100
    }
    
}

extension HomeViewController: GADBannerViewDelegate {
    
}

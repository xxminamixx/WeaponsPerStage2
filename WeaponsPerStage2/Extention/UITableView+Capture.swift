//
//  UITableView+Capture.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/27.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

extension UITableView {
    
    var contentBottom: CGFloat {
        return contentSize.height - bounds.height
    }
    
    override func captureImage() -> UIImage? {
        
        let images = captureImages()
        
        UIGraphicsBeginImageContext(contentSize);
        
        var y: CGFloat = 0
        for image in images {
            // TableViewより上の高さを計算
            let deviceTopHeight = DeviceSizeManager.sharedInstance.naviBarHeight + DeviceSizeManager.sharedInstance.statusBarHeight + DeviceSizeManager.sharedInstance.winLoseViewHeight
            // TabBarの高さ
            let deviceButtomHeight = DeviceSizeManager.sharedInstance.tabBarHeight
            // キャプチャする高さを計算
            let captureHeight = (UIScreen.main.bounds.size.height) - (deviceTopHeight + deviceButtomHeight)
            let cropImage = image.cropping(to: CGRect(x: 0, y: deviceTopHeight, width: bounds.width, height: captureHeight ))
            cropImage?.draw(at: CGPoint(x: 0, y: y))
            y = min(y + bounds.height, contentBottom)
        }
        let concatImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return concatImage
    }
    
    func captureImages() -> [UIImage] {
        
        var images: [UIImage?] = []
        
        while true {
            
            images.append(superview?.captureImage())
            
            if contentOffset.y < (contentBottom - bounds.height) {
                contentOffset.y += bounds.height
            } else {
                contentOffset.y = contentBottom
                images.append(superview?.captureImage())
                break
            }
        }
        
        return images.flatMap{ $0 }
    }
}

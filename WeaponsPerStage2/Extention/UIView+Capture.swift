//
//  UIView+Capture.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/27.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

extension UIView {
    
    func captureImage() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return nil }
        
        self.layer.render(in: context)
        
        let capturedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}

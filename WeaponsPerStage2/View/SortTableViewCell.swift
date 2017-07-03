//
//  SortTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/04/28.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class SortTableViewCell: UITableViewCell {
    
    /// セルID
    static let nibName = "SortTableViewCell"
    /// 武器種ラベル
    @IBOutlet weak var weaponsType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}

//
//  WeaponsPerStageEntity.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import RealmSwift

class WeaponsPerStageEntity: Object {
    dynamic var stage: String?
    dynamic var weapon: String?
    dynamic var weaponIcon: String?
    dynamic var subWeapon: String?
    dynamic var specialWeapon: String?
    dynamic var winlose: String?
}

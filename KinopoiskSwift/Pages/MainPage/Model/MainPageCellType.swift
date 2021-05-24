//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

enum MainPageCellType {
    case showAllItems(listType: TmdbPageableListType)
    case horizontalListItems(models: [TmdbModel])
}

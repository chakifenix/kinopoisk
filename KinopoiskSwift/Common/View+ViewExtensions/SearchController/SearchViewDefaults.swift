//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation
import UIKit.UIColor

public struct SearchViewDefaults {
    
    static let nibName: String = "AZSearchView"
    
    static let reuseIdetentifer = "cell"
    
    static let backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
    
    static let searchBarColor: UIColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
    
    static let searchBarPortraitHeight:CGFloat = 64
    
    static let searchBarLandscapeHeight:CGFloat = 32
    
    static let searchBarPortraitOffset:CGFloat = 10
    
    static let searchBarLandscapeOffset:CGFloat = 0
    
    static let animationDuration = 0.3
    
    static let cellHeight:CGFloat = 44
}

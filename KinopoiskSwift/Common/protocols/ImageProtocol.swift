//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

protocol ImageProtocol {
    var rawValue: String { get }
}

extension ImageProtocol {
    
    var uiImage: UIImage? {
        return UIImage(named: rawValue)
    }
    
    var cgImage: CGImage? {
        return self.uiImage?.cgImage
    }
}

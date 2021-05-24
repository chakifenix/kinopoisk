//
//  UIImage+Extensions.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let renderingMode = self.renderingMode
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result?.withRenderingMode(renderingMode)
    }
}

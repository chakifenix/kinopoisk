//
//  BaseViewInputProtocol.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

typealias VoidCompletion = (() -> Void)

protocol BaseViewInputProtocol: class {
    
    func showActivityIndicator()
    func hideActivityIndicator()
    
    func showError(message: String, completion: VoidCompletion?)
}

extension BaseViewInputProtocol {
    func showError(message: String, completion: VoidCompletion? = nil) {
        showError(message: message, completion: completion)
    }
}

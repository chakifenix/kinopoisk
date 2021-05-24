//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

protocol ListItemsViewInput: BaseViewInputProtocol {
    func set(models: [TmdbModel])
    func set(maxResult: Int)
}

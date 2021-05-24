//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

protocol NetworkService {
    func load(context: NetworkContext, completion: @escaping (NetworkResponse) -> Void)
    func loadDecodable<T: Decodable>(context: NetworkContext, type: T.Type, completion: @escaping (Result<T>) -> Void)
}

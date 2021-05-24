//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

class FailureNetworkResponse: NetworkResponse {
    var data: Data? { return nil }
    let networkError: NetworkError?
    
    init(networkError: NetworkError) {
        self.networkError = networkError
    }
}

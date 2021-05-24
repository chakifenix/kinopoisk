//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

class SucceessNetworkResponse: NetworkResponse {
    var data: Data?
    var networkError: NetworkError? = nil
    
    init(data: Data?) {
        self.data = data
    }
}
